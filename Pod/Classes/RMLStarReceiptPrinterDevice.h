/*!
 *  @header RMLStarReceiptPrinterDevice.h
 *  @discussion Star Receipt Printer device.
 *  @author Dan Sinclair
 *
 *  @copyright 2015 Relish Media Ltd. All rights reserved.
 */

#import <Foundation/Foundation.h>

@interface RMLStarReceiptPrinterDevice : NSObject

/*!
 *  The 'portName' of the device e.g. "BT:PRNT Star"
 */
@property NSString *portName;

/*!
 *  The MAC address of the device
 */
@property NSString *macAddress;

/*!
 *  The model name of the device
 */
@property NSString *modelName;

/*!
 *  An init method to set all properties
 *
 *  @param portName   The full 'portName' for the device e.g. "BT:PRNT Star" (required)
 *  @param macAddress The MAC address (optional)
 *  @param modelName  The model name (optional)
 *
 *  @return instance of RMLStarReceiptPrinterDevice
 */
- (instancetype)initWithPortName:(NSString *)portName macAddess:(NSString *)macAddress modelName:(NSString *)modelName;

/*!
 *  A class method to return a device with portName "BT:PRNT Star"
 *
 *  @return instance of RMLStarReceiptPrinterDevice with portName "BT:PRNT Star"
 */
+ (RMLStarReceiptPrinterDevice*)defaultDevice;

@end
