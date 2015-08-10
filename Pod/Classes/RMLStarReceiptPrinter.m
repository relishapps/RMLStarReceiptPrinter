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
@property (nonatomic, strong) SMPort *port;

@end

@implementation RMLStarReceiptPrinter

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.port = [SMPort getPort:@"BT:PRNT Star" :@"mini" :10000];

        if (self.port == nil || !self.port.connected) {
            return nil;
        }
    }

    self.buffer = [NSMutableData new];

    return self;
}

- (void)dealloc {
    [SMPort releasePort:self.port];
}

- (RMLStarReceiptPrinterStatus)status {
    if (!self.port.connected) {
        return RMLStarReceiptPrinterStatusOffline;
    }
    
    StarPrinterStatus_2 status;
    
    @try {
        [self.port getParsedStatus:&status :2];
        
        if (status.offline == SM_TRUE)
        {
            if (status.coverOpen == SM_TRUE)
            {
                return RMLStarReceiptPrinterStatusOfflineCoverOpen;
            }
            else if (status.receiptPaperEmpty == SM_TRUE)
            {
                return RMLStarReceiptPrinterStatusOfflineOutOfPaper;
            }
            else
            {
                return RMLStarReceiptPrinterStatusOffline;
            }
        }
    }
    @catch (PortException *exception) {
        NSLog(@"%@", exception);
        return RMLStarReceiptPrinterStatusError;
    }

    return RMLStarReceiptPrinterStatusOnline;
}

- (void)setCodePage:(char)codePage {
    char command[] = {0x1b, 0x52, codePage};
    
    [self.buffer appendBytes:command length:sizeof(command)];
}

- (void)setPageAreaWithLength:(char)l andHeight:(char) h {
    char command[] = {0x1d, 0x57, l, h};
    
    [self.buffer appendBytes:command length:sizeof(command)];
}

- (void)setTextAlignment:(RMLStarReceiptPrinterTextAlignment)alignment {
    char command[] = {0x1b, 0x61, alignment};
    
    [self.buffer appendBytes:command length:sizeof(command)];
}

- (void)setCharacterExpansion:(RMLStarReceiptPrinterCharacterExpansion)expansion {
    char command[] = {0x1d, 0x21, expansion};
    
    [self.buffer appendBytes:command length:sizeof(command)];
}

- (void)setTextEmphasis:(RMLStarReceiptPrinterTextEmphasis)emphasis {
    char command[] = {0x1b, 0x45, emphasis};
    
    [self.buffer appendBytes:command length:sizeof(command)];
}

- (void)sendText:(NSString *)text {
    [self.buffer appendData:[text dataUsingEncoding:NSASCIIStringEncoding]];
}

- (void)sendSeparator {
    NSString *separator = [@"" stringByPaddingToLength:32 withString:@"-" startingAtIndex:0];
    
    separator = [separator stringByAppendingString:@"\n"];
    
    [self sendText:separator];
}

- (BOOL)print {
    bool success = NO;
    
    if (!self.port.connected) {
        return NO;
    }

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
