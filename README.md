# RMLStarReceiptPrinter

[![Build Status](https://travis-ci.org/relishapps/RMLStarReceiptPrinter.svg?branch=master)](https://travis-ci.org/relishapps/RMLStarReceiptPrinter)
[![Version](https://img.shields.io/cocoapods/v/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)
[![License](https://img.shields.io/cocoapods/l/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)
[![Platform](https://img.shields.io/cocoapods/p/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)

## Introduction

A wrapper for StarIO SDK that makes printing receipts a breeze.

## Features

- Works with SM-S220i and similar
- Support for 2 inch-wide paper
- Text print with styling: emphasis, alignment, character expansion, various character sets

## Installation

RMLStarReceiptPrinter is available through [CocoaPods](http://cocoapods.org). To install it:

1. Add the following line to your Podfile:

    ```objective-c
    pod "RMLStarReceiptPrinter"
    ```

2. Run `pod install`.
3. Open your `Info.plist` file and add the `jp.star-m.starpro` to `Supported external accessory protocols`.

To run the example project, clone the repo, and run `pod install` from the `Example` directory.

## Usage

To use RMLStarReceiptPrinter in your existing project, once you've installed it, add `#import "RMLStarReceiptPrinter.h"` to the header file where you want to use it, and initialise it.

Initialise with default device (factory name):

```objective-c
RMLStarReceiptPrinter *printer = [RMLStarReceiptPrinter new];
```

Init with specific RMLStarReceiptPrinterDevice:

```objective-c
RMLStarReceiptPrinter *printer = [RMLStarReceiptPrinter printerWithDevice:device];
```

An `NSArray` of available devices can be fetched by:

```objective-c
NSArray *devices = [RMLStarReceiptPrinter availableDevices];
```

To send text to the print buffer:

```objective-c
[printer sendText:@"Hello, world!"];
```

And to send the buffer to the printer:

```objective-c
[printer print];
```

## RMLStarReceiptPrinter Methods

### init
```objective-c
- (instancetype)init;
```

##### Return Value

An instance of RMLStarReceiptPrinter.

##### Description

Used to initialize the printer instance with a default device (one with factory name).

### initWithDevice
```objective-c
- (instancetype)initWithDevice:(RMLStarReceiptPrinterDevice*)device;
```

##### Parameters

<dl>
<dt>device</dt>
<dd>instance of an RMLStarReceiptPrinterDevice object</dd>
</dl>

##### Return Value

instance type of RMLStarReceiptPrinter

##### Description

Used to initialize the printer instance with a specific device



### availableDevices
```objective-c
+ (NSArray *)availableDevices;
```

##### Return Value

An array of RMLStarReceiptPrinterDevice objects

##### Description

Searches both Bluetooth and LAN networks for available printing devices



### print

```objective-c
- (BOOL)print;
```

##### Return Value

a bool value based on the success of the pritner printing the receipt

##### Description

The main method used to tell the printer to print the receipt



### sendSeparator

```objective-c
- (void)sendSeparator;
```

##### Description

Sends a string of 32 hyphens ('-') to the printer, followed by a line break to help separate items on the receipt.



### sendText:

```objective-c
- (void)sendText:(NSString *)text;
```

##### Parameters


<dl>

<dt>text</dt>

<dd>

an NSString for the printer to print

</dd>

</dl>


##### Description

Used to send a single line of text to the printer to print.

**WARNING:**

Format the text before you use this method (i.e. send all emphasis and alignment before ```sendtext:```)



### setCharacterExpansion:

```objective-c
- (void)setCharacterExpansion:(RMLStarReceiptPrinterCharacterExpansion)expansion;
```

##### Parameters

<dl>

<dt>expansion</dt>

<dd>

one of the RMLStarReceiptPrinterCharacterExpansion options

</dd>

</dl>


##### Description

Used to set the size of the characters you send to the printer



### setCharacterSet:

```objective-c
- (void)setCharacterSet:(RMLStarReceiptPrinterCharacterSet)characterSet;
```

##### Parameters

<dl>

<dt>characterSet</dt>

<dd>

RMLStarReceiptPrinterCharacterSet on the character set you want

</dd>

</dl>

##### Description

Set the character encoding set



### setTextAlignment:

```objective-c
- (void)setTextAlignment:(RMLStarReceiptPrinterTextAlignment)alignment;
```

##### Parameters

<dl>

<dt>alignment</dt>

<dd>

The alignment that you want to set (as RMLStarReceiptPrinterTextAlignment)

</dd>

</dl>

##### Description

Adjust the alignment of the text on the receipt



### setTextEmphasis:

```objective-c
- (void)setTextEmphasis:(RMLStarReceiptPrinterTextEmphasis)emphasis;
```

##### Parameters

<dl>

<dt>emphasis</dt>

<dd>

RMLStarReceiptPrinterTextEmphasisIsOff, RMLStarReceiptPrinterTextEmphasisIsOn

</dd>

</dl>

##### Description

Using the RMLStarReceiptPrinterTextEmphasis, you can set whether the following test is emphasised or not



### starIOVersion

```objective-c
+ (NSString *)starIOVersion;
```

##### Return Value

an NSString value of the StarIO framework version number

##### Description

Returns the current version of the StarIO framework in use



### status

```objective-c
- (RMLStarReceiptPrinterStatus)status;
```

##### Return Value

The printer's current status (as RMLStarReceiptPrinterStatus)

##### Description

Returns the current status of the printer (Read-only)



### RMLStarReceiptPrinterCharacterExpansion

```objective-c
typedef NS_ENUM(char, RMLStarReceiptPrinterCharacterExpansion){  
RMLStarReceiptPrinterCharacterExpansionNone = 0,  RMLStarReceiptPrinterCharacterExpansionSingleWidthDoubleHeight =
(
1 << 0)|( 0),  RMLStarReceiptPrinterCharacterExpansionDoubleWidthDoubleHeight =
(
1 << 0)|(
1 << 4) 
};
```
##### Constants

<dl>

<dt>RMLStarReceiptPrinterCharacterExpansionNone</dt>

<dd>

Resets to default width and height

</dd>

<dt>RMLStarReceiptPrinterCharacterExpansionSingleWidthDoubleHeight</dt>

<dd>

Makes characters double height, but maintains width

</dd>

<dt>RMLStarReceiptPrinterCharacterExpansionDoubleWidthDoubleHeight</dt>

<dd>

Makes characters double height and width

</dd>

</dl>

##### Description

An option for changing the height and/or width of the next charaters sent to the printer




### RMLStarReceiptPrinterCharacterSet

```objective-c
typedef NS_ENUM(char, RMLStarReceiptPrinterCharacterSet){  
RMLStarReceiptPrinterCharacterSetUSA,  RMLStarReceiptPrinterCharacterSetFrance,  
RMLStarReceiptPrinterCharacterSetGermany,  RMLStarReceiptPrinterCharacterSetUK,  
RMLStarReceiptPrinterCharacterSetDenmark,  RMLStarReceiptPrinterCharacterSetSweden,  
RMLStarReceiptPrinterCharacterSetItaly,  RMLStarReceiptPrinterCharacterSetSpain,  
RMLStarReceiptPrinterCharacterSetJapan,  RMLStarReceiptPrinterCharacterSetNorway,  
RMLStarReceiptPrinterCharacterSetDenmark2 
};
```

##### Parameters

<dl>

<dt>RMLStarReceiptPrinterCharacterSetUSA</dt>

<dd>

USA character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetFrance</dt>

<dd>

France character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetGermany</dt>

<dd>

Germany character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetUK</dt>

<dd>

UK character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetDenmark</dt>

<dd>

Denmark character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetSweden</dt>

<dd>

Sweden character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetItaly</dt>

<dd>

Italy character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetSpain</dt>

<dd>

Spain character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetJapan</dt>

<dd>

Japan character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetNorway</dt>

<dd>

Norway character set

</dd>

<dt>RMLStarReceiptPrinterCharacterSetDenmark2</dt>

<dd>

Denmark 2 character set

</dd>

</dl>

##### Description

Values to set the character set of the next text sent to the printer to.



### RMLStarReceiptPrinterStatus

```objective-c
typedef NS_ENUM(char, RMLStarReceiptPrinterStatus){  
RMLStarReceiptPrinterStatusOffline,  RMLStarReceiptPrinterStatusOfflineCoverOpen,  
RMLStarReceiptPrinterStatusOfflineOutOfPaper,  RMLStarReceiptPrinterStatusOnline,  
RMLStarReceiptPrinterStatusError 
};
```

##### Parameters

<dl>

<dt><RMLStarReceiptPrinterStatusOffline</dt>

<dd>

The printer is either powered off, or not connected to the device

</dd>

<dt>RMLStarReceiptPrinterStatusOfflineCoverOpen</dt>

<dd>

The printer cover is open

</dd>

<dt>RMLStarReceiptPrinterStatusOfflineOutOfPaper</dt>

<dd>

The printer is out of paper

</dd>

<dt>RMLStarReceiptPrinterStatusOnline</dt>

<dd>

The printer is online and ready to be used

</dd>

<dt>RMLStarReceiptPrinterStatusError</dt>

<dd>

The printer has an error

</dd>

</dl>


##### Description

The current status of the printer



### RMLStarReceiptPrinterTextAlignment

```objective-c
typedef NS_ENUM(char, RMLStarReceiptPrinterTextAlignment){  
RMLStarReceiptPrinterTextAlignmentLeft = 0,  RMLStarReceiptPrinterTextAlignmentCenter = 
1,  RMLStarReceiptPrinterTextAlignmentRight = 2 
};
```

##### Constants

<dl>

<dt>RMLStarReceiptPrinterTextAlignmentLeft</a></dt>

<dd>

Left alignment

</dd>

<dt>RMLStarReceiptPrinterTextAlignmentCenter</a></dt>

<dd>

Center alignment

</dd>

<dt>RMLStarReceiptPrinterTextAlignmentRight</a></dt>

<dd>

Right alignment

</dd>

</dl>

##### Description

Values to set the alignment of next text sent to the printer.



### RMLStarReceiptPrinterTextEmphasis

```objective-c
typedef NS_ENUM(char, RMLStarReceiptPrinterTextEmphasis){  
RMLStarReceiptPrinterTextEmphasisOff = 0,  RMLStarReceiptPrinterTextEmphasisOn = 
1 
};
```

##### Constants

<dl>

<dt>RMLStarReceiptPrinterTextEmphasisOff</a></dt>

<dd>

Turns off the emphasis

</dd>

<dt>RMLStarReceiptPrinterTextEmphasisOn</a></dt>

<dd>

Turns on the emphasis

</dd>

</dl>

##### Description

Equal to setting the text to bold.

* * *
## RMLStarReceiptPrinterDevice Methods

### defaultDevice
```objective-c
+ (RMLStarReceiptPrinterDevice*)defaultDevice;
```
##### Return Value

instance of RMLStarReceiptPrinterDevice with portName "BT:PRNT Star"

##### Description

A class method to return a device with portName "BT:PRNT Star"



### initWithPortName:macAddess:modelName:

```objective-c
- (instancetype)initWithPortName:(NSString *)portName 
macAddess:(NSString *)macAddress modelName:(NSString *)modelName;
```

##### Parameters

<dl>

<dt>portName</dt>

<dd>

The full 'portName' for the device e.g. "BT:PRNT Star" (required)

</dd>

<dt>macAddress</dt>

<dd>

The MAC address (optional)

</dd>

<dt>modelName</dt>

<dd>

The model name (optional)

</dd>

</dl>


##### Return Value

instance of RMLStarReceiptPrinterDevice

##### Description

An init method to set all properties



## RMLStarReceiptPrinterDevice properties

### macAddress

```objective-c
@property NSString *macAddress;
```

##### Description

The MAC address of the device



### modelName

```objective-c
@property NSString *modelName;
```

##### Description

The model name of the device

### portName

```objective-c
@property NSString *portName;
```

##### Description

The 'portName' of the device e.g. "BT:PRNT Star"
* * *

## Planned improvements

- Various widths of paper
- Image printing

## Authors

- Pawel Decowski: pawel@relish.io
- Dan Sinclair: dan@relish.io

## License

RMLStarReceiptPrinter is available under the MIT license. See the LICENSE file for more info.
