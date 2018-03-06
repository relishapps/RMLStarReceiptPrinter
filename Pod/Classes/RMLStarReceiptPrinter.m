//
//  RMLStarReceiptPrinter.m
//  Star Receipt Printer
//
//  Created by Pawel Decowski on 23/10/2014.
//  Copyright (c) 2014 Relish Media Ltd. All rights reserved.
//

#import "RMLStarReceiptPrinter.h"

@interface RMLStarReceiptPrinter ()

@property (nonatomic, strong) NSMutableData *buffer;
@property (nonatomic, strong) ISCBBuilder *builder;
@property (nonatomic, strong) SMPort *port;
@property char paperWidthInCharacters;

@end

@implementation RMLStarReceiptPrinter

+ (NSString *)starIOVersion {
    return [SMPort StarIOVersion];
}

- (instancetype)init {
    return [self initWithDevice:[RMLStarReceiptPrinterDevice defaultDevice]];
}

- (instancetype)initWithDevice:(RMLStarReceiptPrinterDevice *)device {
    self = [super init];
    
    if (self) {
        NSString *settings;
        StarIoExtEmulation emulation;
        
        NSLog(@"Device model: %@", device.modelName);
        
        if ([device.modelName isEqualToString:@"SM-S220"] || [device.modelName isEqualToString:@"SM-S230"]) {
            NSLog(@"Printer emulation: EscPos");
            emulation = StarIoExtEmulationEscPosMobile;
            settings = @"mini";
        } else {
            NSLog(@"Printer emulation: StarPRNT");
            emulation = StarIoExtEmulationStarPRNT;
            settings = @"Portable";
        }

        self.port = [SMPort getPort:device.portName :settings :10000];
        
        if (self.port == nil || !self.port.connected) {
            return nil;
        }
        
        self.buffer = [NSMutableData new];
        self.builder = [StarIoExt createCommandBuilder:emulation];
        self.paperWidthInCharacters = 32;
    }
    
    return self;
}

- (void)dealloc {
    [SMPort releasePort:self.port];
}

+ (NSArray *)availableDevices {
    NSMutableArray *devices = [NSMutableArray new];
    
    NSArray *starDevices = [SMPort searchPrinter];
    
    for (PortInfo *dev in starDevices) {
        [devices addObject:[[RMLStarReceiptPrinterDevice alloc] initWithPortName:dev.portName macAddress:dev.macAddress modelName:dev.modelName]];
    }
    
    return devices;
}

- (RMLStarReceiptPrinterStatus)status {
    RMLStarReceiptPrinterStatus rmlStatus;
    
    if (self.port == nil || !self.port.connected) {
        NSLog(@"Printer status: Not connected");
        return RMLStarReceiptPrinterStatusOffline;
    }
    
    StarPrinterStatus_2 status;

    @try {
        [self.port getParsedStatus:&status :2];

        if (status.offline == SM_TRUE)
        {
            if (status.coverOpen == SM_TRUE)
            {
                NSLog(@"Cover open");
                rmlStatus = RMLStarReceiptPrinterStatusOfflineCoverOpen;
            }
            else if (status.receiptPaperEmpty == SM_TRUE)
            {
                NSLog(@"No paper");
                rmlStatus = RMLStarReceiptPrinterStatusOfflineOutOfPaper;
            }
            else
            {
                NSLog(@"Printer status: Offline");
                rmlStatus = RMLStarReceiptPrinterStatusOffline;
            }
        } else {
            NSLog(@"Online");
            rmlStatus = RMLStarReceiptPrinterStatusOnline;
        }
    }
    @catch (PortException *exception) {
        NSLog(@"%@", exception);
        rmlStatus = RMLStarReceiptPrinterStatusError;
    }
    
    return rmlStatus;
}

- (void)setCharacterSet:(RMLStarReceiptPrinterCharacterSet)characterSet {
    switch(characterSet) {
        case RMLStarReceiptPrinterCharacterSetUK:
            [self.builder appendInternational:SCBInternationalTypeUK];
            break;
        case RMLStarReceiptPrinterCharacterSetUSA:
            [self.builder appendInternational:SCBInternationalTypeUSA];
            break;
        case RMLStarReceiptPrinterCharacterSetItaly:
            [self.builder appendInternational:SCBInternationalTypeItaly];
            break;
        case RMLStarReceiptPrinterCharacterSetJapan:
            [self.builder appendInternational:SCBInternationalTypeJapan];
            break;
        case RMLStarReceiptPrinterCharacterSetSpain:
            [self.builder appendInternational:SCBInternationalTypeSpain];
            break;
        case RMLStarReceiptPrinterCharacterSetFrance:
            [self.builder appendInternational:SCBInternationalTypeFrance];
            break;
        case RMLStarReceiptPrinterCharacterSetNorway:
            [self.builder appendInternational:SCBInternationalTypeNorway];
            break;
        case RMLStarReceiptPrinterCharacterSetSweden:
            [self.builder appendInternational:SCBInternationalTypeSweden];
            break;
        case RMLStarReceiptPrinterCharacterSetDenmark:
            [self.builder appendInternational:SCBInternationalTypeDenmark];
            break;
        case RMLStarReceiptPrinterCharacterSetDenmark2:
            [self.builder appendInternational:SCBInternationalTypeDenmark2];
            break;
        case RMLStarReceiptPrinterCharacterSetGermany:
            [self.builder appendInternational:SCBInternationalTypeGermany];
            break;
    }
}

- (void)setCodePage:(RMLStarReceiptPrinterCodePage)codePage {
    [NSException raise:@"Method not implemented" format:@"Method not implemented"];
}

- (void)setTextAlignment:(RMLStarReceiptPrinterTextAlignment)alignment {
    switch(alignment) {
        case RMLStarReceiptPrinterTextAlignmentLeft:
            [self.builder appendAlignment:SCBAlignmentPositionLeft];
            break;
        case RMLStarReceiptPrinterTextAlignmentRight:
            [self.builder appendAlignment:SCBAlignmentPositionRight];
            break;
        case RMLStarReceiptPrinterTextAlignmentCenter:
            [self.builder appendAlignment:SCBAlignmentPositionCenter];
            break;
    }
}

- (void)setCharacterExpansion:(RMLStarReceiptPrinterCharacterExpansion)expansion {
    switch(expansion) {
        case RMLStarReceiptPrinterCharacterExpansionNone:
            [self.builder appendMultiple:1 height: 1];
            break;
        case RMLStarReceiptPrinterCharacterExpansionDoubleWidthDoubleHeight:
            [self.builder appendMultiple:2 height: 2];
            break;
        case RMLStarReceiptPrinterCharacterExpansionSingleWidthDoubleHeight:
            [self.builder appendMultiple:1 height: 2];
            break;
    }
}

- (void)setTextEmphasis:(RMLStarReceiptPrinterTextEmphasis)emphasis {
    switch(emphasis) {
        case RMLStarReceiptPrinterTextEmphasisOn:
            [self.builder appendEmphasis:YES];
            break;
        case RMLStarReceiptPrinterTextEmphasisOff:
            [self.builder appendEmphasis:NO];
            break;
    }
}

- (void)sendText:(NSString *)text {
    [self.builder appendData:[text dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)sendTextAlignedLeft:(NSString *)textLeft alignedRight:(NSString *)textRight {
    char length = textLeft.length + textRight.length;
    char space_length = self.paperWidthInCharacters - length;
    
    NSString *space = [@"" stringByPaddingToLength:space_length withString:@" " startingAtIndex:0];
    
    [self sendText:[NSString stringWithFormat:@"%@%@%@", textLeft, space, textRight]];
}

- (void)sendTextAlignedLeft:(NSString *)textLeft alignedRightDoubleWidthDoubleHeight:(NSString *)textRight {
    char length = textLeft.length + textRight.length * 2;
    char space_length = self.paperWidthInCharacters - length;
    
    NSString *space = [@"" stringByPaddingToLength:space_length withString:@" " startingAtIndex:0];
    
    [self sendText:[NSString stringWithFormat:@"%@%@", textLeft, space]];
    
    [self setCharacterExpansion:RMLStarReceiptPrinterCharacterExpansionDoubleWidthDoubleHeight];
    
    [self sendText:textRight];
    
    [self setCharacterExpansion:RMLStarReceiptPrinterCharacterExpansionNone];
}

- (void)sendSeparator {
    NSString *separator = [@"" stringByPaddingToLength:self.paperWidthInCharacters withString:@"-" startingAtIndex:0];
    
    separator = [separator stringByAppendingString:@"\n"];
    
    [self sendText:separator];
}

- (BOOL)print {
    bool success = NO;
    
    if (!self.port.connected) {
        return NO;
    }
    
    self.buffer = [self.builder commands];

    unsigned char *commands = (unsigned char *)malloc([self.buffer length]);
    [self.buffer getBytes:commands length:[self.buffer length]];
    int commandSize = (int)[self.buffer length];
    
    [self.buffer setLength:0];
    
    int totalWritten = 0;

    @try {
        while (totalWritten < commandSize) {
            int remaining = commandSize - totalWritten;
            
            int blockSize = (remaining > 1024) ? 1024 : remaining;
            
            int written = [self.port writePort:commands :totalWritten :blockSize];
            totalWritten += written;
        }
        
        success = TRUE;
    }
    @catch (PortException *exception) {
        NSLog(@"%@", exception);
    }
    
    free(commands);
    
    return success;
}

@end
