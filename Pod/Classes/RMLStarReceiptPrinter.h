//
//  RMLStarReceiptPrinter.h
//  Star Receipt Printer
//
//  Created by Pawel Decowski on 23/10/2014.
//  Copyright (c) 2014 Relish Media Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <StarIO/SMPort.h>

typedef NS_ENUM(char, RMLStarReceiptPrinterStatus) {
    RMLStarReceiptPrinterStatusOffline,
    RMLStarReceiptPrinterStatusOfflineCoverOpen,
    RMLStarReceiptPrinterStatusOfflineOutOfPaper,
    RMLStarReceiptPrinterStatusOnline,
    RMLStarReceiptPrinterStatusError
};

typedef NS_ENUM(char, RMLStarReceiptPrinterCharacterExpansion) {
    RMLStarReceiptPrinterCharacterExpansionNone = 0,
    RMLStarReceiptPrinterCharacterExpansionSingleWidthDoubleHeight = (1 << 0) | (     0),
    RMLStarReceiptPrinterCharacterExpansionDoubleWidthDoubleHeight = (1 << 0) | (1 << 4)
};

typedef NS_ENUM(char, RMLStarReceiptPrinterTextEmphasis) {
    RMLStarReceiptPrinterTextEmphasisOff = 0,
    RMLStarReceiptPrinterTextEmphasisOn = 1
};

typedef NS_ENUM(char, RMLStarReceiptPrinterTextAlignment) {
    RMLStarReceiptPrinterTextAlignmentLeft = 0,
    RMLStarReceiptPrinterTextAlignmentCenter = 1,
    RMLStarReceiptPrinterTextAlignmentRight = 2
};

@interface RMLStarReceiptPrinter : NSObject

+ (NSString *)starIOVersion;

- (instancetype)init;
- (RMLStarReceiptPrinterStatus)status;

- (void)setCodePage:(char)codePage;
- (void)setPageAreaWithLength:(char)l andHeight:(char) h;
- (void)setTextEmphasis:(RMLStarReceiptPrinterTextEmphasis)emphasis;
- (void)setCharacterExpansion:(RMLStarReceiptPrinterCharacterExpansion)expansion;
- (void)setTextAlignment:(RMLStarReceiptPrinterTextAlignment)alignment;
- (void)sendText:(NSString *)text;
- (void)sendSeparator;
- (BOOL)print;

@end
