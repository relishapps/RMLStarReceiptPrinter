//
//  RMLStarReceiptPrinterDevice.h
//  Pods
//
//  Created by Dan Sinclair on 14/08/2015.
//
//

#import <Foundation/Foundation.h>

@interface RMLStarReceiptPrinterDevice : NSObject

@property NSString *portName;
@property NSString *macAddress;
@property NSString *modelName;

- (instancetype)initWithPortName:(NSString *)portName macAddess:(NSString *)macAddress modelName:(NSString *)modelName;

+ (RMLStarReceiptPrinterDevice*)defaultDevice;

@end
