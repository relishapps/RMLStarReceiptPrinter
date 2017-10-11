//
//  RMLStarReceiptPrinterDevice.m
//  Pods
//
//  Created by Dan Sinclair on 14/08/2015.
//
//

#import "RMLStarReceiptPrinterDevice.h"

#define defaultPortName @"BT:PRNT Star"

@implementation RMLStarReceiptPrinterDevice

- (instancetype)initWithPortName:(NSString *)portName macAddress:(NSString *)macAddress modelName:(NSString *)modelName {
    self = [super init];
    
    if (self) {
        self.portName = portName;
        self.macAddress = macAddress;
        self.modelName = modelName;
    }
    
    return self;
}

+ (RMLStarReceiptPrinterDevice *)defaultDevice {
    return [[self alloc] initWithPortName:defaultPortName macAddress:nil modelName:nil];
}

@end
