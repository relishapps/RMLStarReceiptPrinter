/*!
 *  @header RMLStarReceiptPrinter.h
 *  @discussion Star Receipt Printer. A wrapper for StarIO's iOS SDK
 *  @author Pawel Decowski
 *
 *  @copyright 2015 Relish Media Ltd. All rights reserved.
 */

#import <Foundation/Foundation.h>

#import "RMLStarReceiptPrinterDevice.h"

#import <StarIO/SMPort.h>
#import <StarIO_Extension/StarIoExt.h>
#import <StarIO_Extension/StarIoExtManager.h>

/*!
 *  @typedef RMLStarReceiptPrinterStatus
 *
 *  The current status of the printer
 */
typedef NS_ENUM(char, RMLStarReceiptPrinterStatus) {
    /*!
     *  The printer is either powered off, or not connected to the device
     */
    RMLStarReceiptPrinterStatusOffline,
    /*!
     *  The printer cover is open
     */
    RMLStarReceiptPrinterStatusOfflineCoverOpen,
    /*!
     *  The printer is out of paper
     */
    RMLStarReceiptPrinterStatusOfflineOutOfPaper,
    /*!
     *  The printer is online and ready to be used
     */
    RMLStarReceiptPrinterStatusOnline,
    /*!
     *  The printer has an error
     */
    RMLStarReceiptPrinterStatusError
};

/*!
 *  @typedef RMLStarReceiptPrinterCharacterExpansion
 *
 *  An option for changing the height and/or width of the next charaters sent to the printer
 */
typedef NS_ENUM(char, RMLStarReceiptPrinterCharacterExpansion) {
    /*!
     *  Resets to default width and height
     */
    RMLStarReceiptPrinterCharacterExpansionNone = 0,
    /*!
     *  Makes characters double height, but maintains width
     */
    RMLStarReceiptPrinterCharacterExpansionSingleWidthDoubleHeight =(1 << 0)|(     0),
    /*!
     *  Makes characters double height and width
     */
    RMLStarReceiptPrinterCharacterExpansionDoubleWidthDoubleHeight =(1 << 0)|(1 << 4)
};

/*!
 *  @typedef RMLStarReceiptPrinterTextEmphasis
 *
 *  Equal to setting the text to bold.
 */
typedef NS_ENUM(char, RMLStarReceiptPrinterTextEmphasis) {
    /*!
     *  Turns off the emphasis
     */
    RMLStarReceiptPrinterTextEmphasisOff = 0,
    /*!
     *  Turns on the emphasis
     */
    RMLStarReceiptPrinterTextEmphasisOn = 1
};

/*!
 *  @typedef RMLStarReceiptPrinterTextAlignment
 *
 *  Values to set the alignment of next text sent to the printer.
 */
typedef NS_ENUM(char, RMLStarReceiptPrinterTextAlignment) {
    /*!
     *  Left alignment
     */
    RMLStarReceiptPrinterTextAlignmentLeft = 0,
    /*!
     *  Center alignment
     */
    RMLStarReceiptPrinterTextAlignmentCenter = 1,
    /*!
     *  Right alignment
     */
    RMLStarReceiptPrinterTextAlignmentRight = 2
};

/*!
 *  @typedef RMLStarReceiptPrinterCharacterSet
 *
 *  Values to set the character set of the next text sent to the printer to.
 */
typedef NS_ENUM(char, RMLStarReceiptPrinterCharacterSet) {
    /*!
     *  USA character set
     */
    RMLStarReceiptPrinterCharacterSetUSA,
    /*!
     *  France character set
     */
    RMLStarReceiptPrinterCharacterSetFrance,
    /*!
     *  Germany character set
     */
    RMLStarReceiptPrinterCharacterSetGermany,
    /*!
     *  UK character set
     */
    RMLStarReceiptPrinterCharacterSetUK,
    /*!
     *  Denmark character set
     */
    RMLStarReceiptPrinterCharacterSetDenmark,
    /*!
     *  Sweden character set
     */
    RMLStarReceiptPrinterCharacterSetSweden,
    /*!
     *  Italy character set
     */
    RMLStarReceiptPrinterCharacterSetItaly,
    /*!
     *  Spain character set
     */
    RMLStarReceiptPrinterCharacterSetSpain,
    /*!
     *  Japan character set
     */
    RMLStarReceiptPrinterCharacterSetJapan,
    /*!
     *  Norway character set
     */
    RMLStarReceiptPrinterCharacterSetNorway,
    /*!
     *  Denmark 2 character set
     */
    RMLStarReceiptPrinterCharacterSetDenmark2
};

typedef NS_ENUM(char, RMLStarReceiptPrinterCodePage) {
    RMLStarReceiptPrinterCodePage437,
    RMLStarReceiptPrinterCodePage737,
    RMLStarReceiptPrinterCodePage772,
    RMLStarReceiptPrinterCodePage774,
    RMLStarReceiptPrinterCodePage851,
    RMLStarReceiptPrinterCodePage852,
    RMLStarReceiptPrinterCodePage855,
    RMLStarReceiptPrinterCodePage857,
    RMLStarReceiptPrinterCodePage858,
    RMLStarReceiptPrinterCodePage860,
    RMLStarReceiptPrinterCodePage861,
    RMLStarReceiptPrinterCodePage862,
    RMLStarReceiptPrinterCodePage863,
    RMLStarReceiptPrinterCodePage864,
    RMLStarReceiptPrinterCodePage865,
    RMLStarReceiptPrinterCodePage866,
    RMLStarReceiptPrinterCodePage869,
    RMLStarReceiptPrinterCodePage874,
    RMLStarReceiptPrinterCodePage928
};

@interface RMLStarReceiptPrinter : NSObject

/*!
 *  Returns the current version of the StarIO framework in use
 *
 *  @return an NSString value of the StarIO framework version number
 */
+ (NSString *)starIOVersion;

/*!
 *  Used to initialize the printer instance with a default device
 *
 *  @return instance type of RMLStarReceiptPrinter
 */
- (instancetype)init;

/*!
 *  Used to initialize the printer instance with a specific device
 *
 *  @param device An instance of an RMLStarReceiptPrinterDevice object
 *
 *  @return instance type of RMLStarReceiptPrinter
 */
- (instancetype)initWithDevice:(RMLStarReceiptPrinterDevice*)device;

/*!
 *  Searches both Bluetooth and LAN networks for available printing devices
 *
 *  @return An array of RMLStarReceiptPrinterDevice objects
 */
+ (NSArray *)availableDevices;

/*!
 *  Returns the current status of the printer (Read-only)
 *
 *  @return The printer's current status (as RMLStarReceiptPrinterStatus)
 */
- (RMLStarReceiptPrinterStatus)status;

/*!
 *  Set the character encoding set
 *
 *  @param characterSet RMLStarReceiptPrinterCharacterSet on the character set you want
 */
- (void)setCharacterSet:(RMLStarReceiptPrinterCharacterSet)characterSet;

/*!
 * Set the code page
 * @param codePage RMLStarReceiptPrinterCodePage
 */
- (void)setCodePage:(RMLStarReceiptPrinterCodePage)codePage;

/*!
 *  Using the RMLStarReceiptPrinterTextEmphasis, you can set whether the following test is emphasised or not
 *
 *  @param emphasis RMLStarReceiptPrinterTextEmphasisIsOff, RMLStarReceiptPrinterTextEmphasisIsOn
 */
- (void)setTextEmphasis:(RMLStarReceiptPrinterTextEmphasis)emphasis;

/*!
 *  Used to set the size of the characters you send to the printer
 *
 *  @param expansion one of the RMLStarReceiptPrinterCharacterExpansion options
 */
- (void)setCharacterExpansion:(RMLStarReceiptPrinterCharacterExpansion)expansion;

/*!
 *  Adjust the alignment of the text on the receipt
 *
 *  @param alignment The alignment that you want to set (as RMLStarReceiptPrinterTextAlignment)
 */
- (void)setTextAlignment:(RMLStarReceiptPrinterTextAlignment)alignment;

/*!
 *  Used to send a single line of text to the printer to print.
 *
 *  @warning Format the text before you use this method (i.e. send all @c emphasis and @c alignment parameters before sending this string
 *
 *  @param text an NSString for the printer to print
 */
- (void)sendText:(NSString *)text;

/*!
 */
- (void)sendTextAlignedLeft:(NSString *)textLeft alignedRight:(NSString *)textRight;

/*!
 */
- (void)sendTextAlignedLeft:(NSString *)textLeft alignedRightDoubleWidthDoubleHeight:(NSString *)textRight;

/*!
 *  Sends a string of 32 hyphens ('-') to the printer, followed by a line break to help separate items on the receipt.
 */
- (void)sendSeparator;

/*!
 *  The main method used to tell the printer to print the receipt
 *
 *  @return a bool value based on the success of the pritner printing the receipt
 */
- (BOOL)print;

@end
