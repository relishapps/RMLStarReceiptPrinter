# RMLStarReceiptPrinter

[![CI Status](http://img.shields.io/travis/Pawel%20Decowski/RMLStarReceiptPrinter.svg?style=flat)](https://travis-ci.org/Pawel%20Decowski/RMLStarReceiptPrinter)
[![Version](https://img.shields.io/cocoapods/v/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)
[![License](https://img.shields.io/cocoapods/l/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)
[![Platform](https://img.shields.io/cocoapods/p/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)


## Introduction

Star Receipt Printer. A wrapper for StarIO's iOS SDK

## Installation

RMLStarReceiptPrinter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RMLStarReceiptPrinter"
```
Once it's installed via pod, add the [```StarIO.framework```]() to your project.

## Usage

To run the example project, clone the repo, and run pod install from the Example directory first.

To use RMLStarReceiptPrinter in your existing project, once you've installed it, add ```#import "RMLStarReceiptPrinter.h"``` to the header file where you want to use it, and initialize it;

```ruby
RMLStarReceiptPrinter *printer = [RMLStarReceiptPrinter new];
```
Use the methods below to then what you need, to the printer


* * *
## Methods

### init
```ruby
- (instancetype)init;
```

##### Return Value

instance type of RMLStarReceiptPrinter

##### Discussion

Used to initialize the printer instance (Not used)



### print

```ruby
- (BOOL)print;
```

##### Return Value

a bool value based on the success of the pritner printing the receipt

##### Discussion

The main method used to tell the printer to print the receipt



### sendSeparator

```ruby
- (void)sendSeparator;
```

##### Discussion

Sends a string of 32 hyphens ('-') to the printer, followed by a line break to help separate items on the receipt.



### sendText:

```ruby
- (void)sendText:(NSString *)text;
```

##### Parameters


<dl>

<dt>text</dt>

<dd>

an NSString for the printer to print

</dd>

</dl>


##### Discussion

Used to send a single line of text to the printer to print.

**WARNING:**

Format the text before you use this method (i.e. send all emphasis and alignment before ```sendtext:```)



### setCharacterExpansion:

```ruby
- (void)setCharacterExpansion:(RMLStarReceiptPrinterCharacterExpansion)expansion;
```

##### Parameters

<dl>

<dt>expansion</dt>

<dd>

one of the RMLStarReceiptPrinterCharacterExpansion options

</dd>

</dl>


##### Discussion

Used to set the size of the characters you send to the printer



### setCharacterSet:

```ruby
- (void)setCharacterSet:(RMLStarReceiptPrinterCharacterSet)characterSet;
```

##### Parameters

<dl>

<dt>characterSet</dt>

<dd>

RMLStarReceiptPrinterCharacterSet on the character set you want

</dd>

</dl>

##### Discussion

Set the character encoding set



### setTextAlignment:

```ruby
- (void)setTextAlignment:(RMLStarReceiptPrinterTextAlignment)alignment;
```

##### Parameters

<dl>

<dt>alignment</dt>

<dd>

The alignment that you want to set (as RMLStarReceiptPrinterTextAlignment)

</dd>

</dl>

##### Discussion

Adjust the alignment of the text on the receipt



### setTextEmphasis:

```ruby
- (void)setTextEmphasis:(RMLStarReceiptPrinterTextEmphasis)emphasis;
```

##### Parameters

<dl>

<dt>emphasis</dt>

<dd>

RMLStarReceiptPrinterTextEmphasisIsOff, RMLStarReceiptPrinterTextEmphasisIsOn

</dd>

</dl>

##### Discussion

Using the RMLStarReceiptPrinterTextEmphasis, you can set whether the following test is emphasised or not



### starIOVersion

```ruby
+ (NSString *)starIOVersion;
```

##### Return Value

an NSString value of the StarIO framework version number

##### Discussion

Returns the current version of the StarIO framework in use



### status

```ruby
- (RMLStarReceiptPrinterStatus)status;
```

##### Return Value

The printer's current status (as RMLStarReceiptPrinterStatus)

##### Discussion

Returns the current status of the printer (Read-only)



### RMLStarReceiptPrinterCharacterExpansion

```ruby
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

dl>

<dt>RMLStarReceiptPrinterCharacterExpansionSingleWidthDoubleHeight</dt>

<dd>

Makes characters double height, but maintains width

</dd>

dl>

<dt>RMLStarReceiptPrinterCharacterExpansionDoubleWidthDoubleHeight</dt>

<dd>

Makes characters double height and width

</dd>

</dl>

##### Discussion

An option for changing the height and/or width of the next charaters sent to the printer




### RMLStarReceiptPrinterCharacterSet

```ruby
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

##### Discussion

Values to set the character set of the next text sent to the printer to.



### RMLStarReceiptPrinterStatus

```ruby
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


##### Discussion

The current status of the printer



### RMLStarReceiptPrinterTextAlignment

```ruby
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

##### Discussion

Values to set the alignment of next text sent to the printer.



### RMLStarReceiptPrinterTextEmphasis

```ruby
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

##### Discussion

Equal to setting the text to bold.

* * *

## Author

Pawel Decowski, pawel.decowski@gmail.com

## License

RMLStarReceiptPrinter is available under the MIT license. See the LICENSE file for more info.