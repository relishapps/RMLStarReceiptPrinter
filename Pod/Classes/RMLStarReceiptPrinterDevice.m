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

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:self.class]) {
        return NO;
    }
    
    RMLStarReceiptPrinterDevice *other = object;
    
    return [self.portName isEqual:other.portName];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    
    if (self) {
        self.portName = [coder decodeObjectForKey:@"portName"];
        self.macAddress = [coder decodeObjectForKey:@"macAddress"];
        self.modelName = [coder decodeObjectForKey:@"modelName"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.portName forKey:@"portName"];
    [coder encodeObject:self.macAddress forKey:@"macAddress"];
    [coder encodeObject:self.modelName forKey:@"modelName"];
}

@end
