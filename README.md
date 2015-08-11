# RMLStarReceiptPrinter

[![CI Status](http://img.shields.io/travis/Pawel%20Decowski/RMLStarReceiptPrinter.svg?style=flat)](https://travis-ci.org/Pawel Decowski/RMLStarReceiptPrinter)
[![Version](https://img.shields.io/cocoapods/v/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)
[![License](https://img.shields.io/cocoapods/l/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)
[![Platform](https://img.shields.io/cocoapods/p/RMLStarReceiptPrinter.svg?style=flat)](http://cocoapods.org/pods/RMLStarReceiptPrinter)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RMLStarReceiptPrinter is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RMLStarReceiptPrinter"
```

## Introduction

Star Receipt Printer. A wrapper for StarIO's iOS SDK


* * *

<a name="//apple_ref/c/func/init"></a>

### <a name="init">init</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">instancetype</span>)<span class="var">init</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Return Value</font>

instance type of RMLStarReceiptPrinter

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Used to initialize the printer instance (Not used)

* * *

<a name="//apple_ref/c/func/print"></a>

### <a name="print">print</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">BOOL</span>)<span class="var">print</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Return Value</font>

a bool value based on the success of the pritner printing the receipt

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

The main method used to tell the printer to print the receipt

* * *

<a name="//apple_ref/c/func/sendSeparator"></a>

### <a name="sendSeparator">sendSeparator</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">void</span>)<span class="var">sendSeparator</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Sends a string of 32 hyphens ('-') to the printer, followed by a line break to help separate items on the receipt.

* * *

<a name="//apple_ref/c/func/sendText:"></a>

### <a name="sendText:">sendText:</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">void</span>)<span class="function">sendText</span>:(<span class="type">NSString</span> <span class="type">*</span>)<span class="var">text</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Parameters</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/methodparam/sendText:/text"></a>`text`</dt>

<dd>

an NSString for the printer to print

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Used to send a single line of text to the printer to print.

**WARNING:**

<div class="warning_indent">

Format the text before you use this method (i.e. send all @c emphasis and

</div>

* * *

<a name="//apple_ref/c/func/setCharacterExpansion:"></a>

### <a name="setCharacterExpansion:">setCharacterExpansion:</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">void</span>)<span class="function">setCharacterExpansion</span>:(<span class="type">RMLStarReceiptPrinterCharacterExpansion</span>)<span class="var">expansion</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Parameters</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/methodparam/setCharacterExpansion:/expansion"></a>`expansion`</dt>

<dd>

one of the RMLStarReceiptPrinterCharacterExpansion options

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Used to set the size of the characters you send to the printer

* * *

<a name="//apple_ref/c/func/setCharacterSet:"></a>

### <a name="setCharacterSet:">setCharacterSet:</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">void</span>)<span class="function">setCharacterSet</span>:(<span class="type">RMLStarReceiptPrinterCharacterSet</span>)<span class="var">characterSet</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Parameters</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/methodparam/setCharacterSet:/characterSet"></a>`characterSet`</dt>

<dd>

RMLStarReceiptPrinterCharacterSet on the character set you want

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Set the character encoding set

* * *

<a name="//apple_ref/c/func/setTextAlignment:"></a>

### <a name="setTextAlignment:">setTextAlignment:</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">void</span>)<span class="function">setTextAlignment</span>:(<span class="type">RMLStarReceiptPrinterTextAlignment</span>)<span class="var">alignment</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Parameters</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/methodparam/setTextAlignment:/alignment"></a>`alignment`</dt>

<dd>

The alignment that you want to set (as RMLStarReceiptPrinterTextAlignment)

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Adjust the alignment of the text on the receipt

* * *

<a name="//apple_ref/c/func/setTextEmphasis:"></a>

### <a name="setTextEmphasis:">setTextEmphasis:</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">void</span>)<span class="function">setTextEmphasis</span>:(<span class="type">RMLStarReceiptPrinterTextEmphasis</span>)<span class="var">emphasis</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Parameters</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/methodparam/setTextEmphasis:/emphasis"></a>`emphasis`</dt>

<dd>

RMLStarReceiptPrinterTextEmphasisIsOff, RMLStarReceiptPrinterTextEmphasisIsOn

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Using the RMLStarReceiptPrinterTextEmphasis, you can set whether the following test is emphasised or not

* * *

<a name="//apple_ref/c/func/starIOVersion"></a>

### <a name="starIOVersion">starIOVersion</a>

* * *

<div class="declaration_indent">

<pre>+ (<span class="type">NSString</span> <span class="type">*</span>)<span class="var">starIOVersion</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Return Value</font>

an NSString value of the StarIO framework version number

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Returns the current version of the StarIO framework in use

* * *

<a name="//apple_ref/c/func/status"></a>

### <a name="status">status</a>

* * *

<div class="declaration_indent">

<pre>- (<span class="type">RMLStarReceiptPrinterStatus</span>)<span class="var">status</span>;  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Return Value</font>

The printer's current status (as RMLStarReceiptPrinterStatus)

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Returns the current status of the printer (Read-only)

* * *

<a name="HeaderDoc_datatypes"></a>

## Typedefs

<dl>

<dt><tt>[RMLStarReceiptPrinterCharacterExpansion](index.html#//apple_ref/doc/title:tdef/RMLStarReceiptPrinterCharacterExpansion)</tt></dt>

<dt><tt>[RMLStarReceiptPrinterCharacterSet](index.html#//apple_ref/doc/title:tdef/RMLStarReceiptPrinterCharacterSet)</tt></dt>

<dt><tt>[RMLStarReceiptPrinterStatus](index.html#//apple_ref/doc/title:tdef/RMLStarReceiptPrinterStatus)</tt></dt>

<dt><tt>[RMLStarReceiptPrinterTextAlignment](index.html#//apple_ref/doc/title:tdef/RMLStarReceiptPrinterTextAlignment)</tt></dt>

<dt><tt>[RMLStarReceiptPrinterTextEmphasis](index.html#//apple_ref/doc/title:tdef/RMLStarReceiptPrinterTextEmphasis)</tt></dt>

</dl>

* * *

<a name="//apple_ref/doc/title:tdef/RMLStarReceiptPrinterCharacterExpansion"></a>

### <a name="RMLStarReceiptPrinterCharacterExpansion">RMLStarReceiptPrinterCharacterExpansion</a>

* * *

<div class="declaration_indent">

<pre><span class="keyword">typedef</span> <span class="function">NS_ENUM</span>(<span class="var">char</span>, <span class="var">RMLStarReceiptPrinterCharacterExpansion</span>){  
<span class="type">RMLStarReceiptPrinterCharacterExpansionNone</span> = <span class="number">0</span>,  <span class="type">RMLStarReceiptPrinterCharacterExpansionSingleWidthDoubleHeight</span> =
(
<span class="number">1</span> << <span class="number">0</span>)|( <span class="number">0</span>),  <span class="type">RMLStarReceiptPrinterCharacterExpansionDoubleWidthDoubleHeight</span> =
(
<span class="number">1</span> << <span class="number">0</span>)|(
<span class="number">1</span> << <span class="number">4</span>) 
};  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Constants</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/title:econst/RMLStarReceiptPrinterCharacterExpansionNone">`RMLStarReceiptPrinterCharacterExpansionNone`</a></dt>

<dd>

Resets to default width and height

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

An option for changing the height and/or width of the next charaters sent to the printer

**See Also**

<div class="list_indent">

<dl>

<dt>

char

</dt>

</dl>

</div>

* * *

<a name="//apple_ref/doc/title:tdef/RMLStarReceiptPrinterCharacterSet"></a>

### <a name="RMLStarReceiptPrinterCharacterSet">RMLStarReceiptPrinterCharacterSet</a>

* * *

<div class="declaration_indent">

<pre><span class="keyword">typedef</span> <span class="function">NS_ENUM</span>(<span class="var">char</span>, <span class="var">RMLStarReceiptPrinterCharacterSet</span>){  
<span class="var">RMLStarReceiptPrinterCharacterSetUSA</span>,  <span class="var">RMLStarReceiptPrinterCharacterSetFrance</span>,  
<span class="var">RMLStarReceiptPrinterCharacterSetGermany</span>,  <span class="var">RMLStarReceiptPrinterCharacterSetUK</span>,  
<span class="var">RMLStarReceiptPrinterCharacterSetDenmark</span>,  <span class="var">RMLStarReceiptPrinterCharacterSetSweden</span>,  
<span class="var">RMLStarReceiptPrinterCharacterSetItaly</span>,  <span class="var">RMLStarReceiptPrinterCharacterSetSpain</span>,  
<span class="var">RMLStarReceiptPrinterCharacterSetJapan</span>,  <span class="var">RMLStarReceiptPrinterCharacterSetNorway</span>,  
<span class="var">RMLStarReceiptPrinterCharacterSetDenmark2</span> 
};  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Parameters</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetUSA"></a>`RMLStarReceiptPrinterCharacterSetUSA`</dt>

<dd>

USA character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetFrance"></a>`RMLStarReceiptPrinterCharacterSetFrance`</dt>

<dd>

France character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetGermany"></a>`RMLStarReceiptPrinterCharacterSetGermany`</dt>

<dd>

Germany character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetUK"></a>`RMLStarReceiptPrinterCharacterSetUK`</dt>

<dd>

UK character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetDenmark"></a>`RMLStarReceiptPrinterCharacterSetDenmark`</dt>

<dd>

Denmark character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetSweden"></a>`RMLStarReceiptPrinterCharacterSetSweden`</dt>

<dd>

Sweden character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetItaly"></a>`RMLStarReceiptPrinterCharacterSetItaly`</dt>

<dd>

Italy character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetSpain"></a>`RMLStarReceiptPrinterCharacterSetSpain`</dt>

<dd>

Spain character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetJapan"></a>`RMLStarReceiptPrinterCharacterSetJapan`</dt>

<dd>

Japan character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetNorway"></a>`RMLStarReceiptPrinterCharacterSetNorway`</dt>

<dd>

Norway character set

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterCharacterSet/RMLStarReceiptPrinterCharacterSetDenmark2"></a>`RMLStarReceiptPrinterCharacterSetDenmark2`</dt>

<dd>

Denmark 2 character set

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Values to set the character set of the next text sent to the printer to.

**See Also**

<div class="list_indent">

<dl>

<dt>

NS_ENUM

</dt>

</dl>

</div>

* * *

<a name="//apple_ref/doc/title:tdef/RMLStarReceiptPrinterStatus"></a>

### <a name="RMLStarReceiptPrinterStatus">RMLStarReceiptPrinterStatus</a>

* * *

<div class="declaration_indent">

<pre><span class="keyword">typedef</span> <span class="function">NS_ENUM</span>(<span class="var">char</span>, <span class="var">RMLStarReceiptPrinterStatus</span>){  
<span class="var">RMLStarReceiptPrinterStatusOffline</span>,  <span class="var">RMLStarReceiptPrinterStatusOfflineCoverOpen</span>,  
<span class="var">RMLStarReceiptPrinterStatusOfflineOutOfPaper</span>,  <span class="var">RMLStarReceiptPrinterStatusOnline</span>,  
<span class="var">RMLStarReceiptPrinterStatusError</span> 
};  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Parameters</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterStatus/RMLStarReceiptPrinterStatusOffline"></a>`RMLStarReceiptPrinterStatusOffline`</dt>

<dd>

The printer is either powered off, or not connected to the device

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterStatus/RMLStarReceiptPrinterStatusOfflineCoverOpen"></a>`RMLStarReceiptPrinterStatusOfflineCoverOpen`</dt>

<dd>

The printer cover is open

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterStatus/RMLStarReceiptPrinterStatusOfflineOutOfPaper"></a>`RMLStarReceiptPrinterStatusOfflineOutOfPaper`</dt>

<dd>

The printer is out of paper

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterStatus/RMLStarReceiptPrinterStatusOnline"></a>`RMLStarReceiptPrinterStatusOnline`</dt>

<dd>

The printer is online and ready to be used

</dd>

<dt><a name="//apple_ref/doc/typedeffield/RMLStarReceiptPrinterStatus/RMLStarReceiptPrinterStatusError"></a>`RMLStarReceiptPrinterStatusError`</dt>

<dd>

The printer has an error

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

The current status of the printer

**See Also**

<div class="list_indent">

<dl>

<dt>

NS_ENUM

</dt>

</dl>

</div>

* * *

<a name="//apple_ref/doc/title:tdef/RMLStarReceiptPrinterTextAlignment"></a>

### <a name="RMLStarReceiptPrinterTextAlignment">RMLStarReceiptPrinterTextAlignment</a>

* * *

<div class="declaration_indent">

<pre><span class="keyword">typedef</span> <span class="function">NS_ENUM</span>(<span class="var">char</span>, <span class="var">RMLStarReceiptPrinterTextAlignment</span>){  
<span class="type">RMLStarReceiptPrinterTextAlignmentLeft</span> = <span class="number">0</span>,  <span class="type">RMLStarReceiptPrinterTextAlignmentCenter</span> = 
<span class="number">1</span>,  <span class="type">RMLStarReceiptPrinterTextAlignmentRight</span> = <span class="number">2</span> 
};  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Constants</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/title:econst/RMLStarReceiptPrinterTextAlignmentLeft">`RMLStarReceiptPrinterTextAlignmentLeft`</a></dt>

<dd>

Left alignment

</dd>

<dt><a name="//apple_ref/doc/title:econst/RMLStarReceiptPrinterTextAlignmentCenter">`RMLStarReceiptPrinterTextAlignmentCenter`</a></dt>

<dd>

Center alignment

</dd>

<dt><a name="//apple_ref/doc/title:econst/RMLStarReceiptPrinterTextAlignmentRight">`RMLStarReceiptPrinterTextAlignmentRight`</a></dt>

<dd>

Right alignment

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Values to set the alignment of next text sent to the printer.

**See Also**

<div class="list_indent">

<dl>

<dt>

NS_ENUM

</dt>

</dl>

</div>

* * *

<a name="//apple_ref/doc/title:tdef/RMLStarReceiptPrinterTextEmphasis"></a>

### <a name="RMLStarReceiptPrinterTextEmphasis">RMLStarReceiptPrinterTextEmphasis</a>

* * *

<div class="declaration_indent">

<pre><span class="keyword">typedef</span> <span class="function">NS_ENUM</span>(<span class="var">char</span>, <span class="var">RMLStarReceiptPrinterTextEmphasis</span>){  
<span class="type">RMLStarReceiptPrinterTextEmphasisOff</span> = <span class="number">0</span>,  <span class="type">RMLStarReceiptPrinterTextEmphasisOn</span> = 
<span class="number">1</span> 
};  </pre>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Constants</font>

<div class="param_indent">

<dl>

<dt><a name="//apple_ref/doc/title:econst/RMLStarReceiptPrinterTextEmphasisOff">`RMLStarReceiptPrinterTextEmphasisOff`</a></dt>

<dd>

Turns off the emphasis

</dd>

<dt><a name="//apple_ref/doc/title:econst/RMLStarReceiptPrinterTextEmphasisOn">`RMLStarReceiptPrinterTextEmphasisOn`</a></dt>

<dd>

Turns on the emphasis

</dd>

</dl>

</div>

##### <font face="Lucida Grande,Helvetica,Arial">Discussion</font>

Equal to setting the text to bold.

**See Also**

<div class="list_indent">

<dl>

<dt>

NS_ENUM

</dt>

</dl>

</div>

* * *

<div class="hd_copyright_and_timestamp">

© 2015 Relish Media Ltd. All rights reserved.

Last Updated: Tuesday, August 11, 2015

</div>


## Author

Pawel Decowski, pawel.decowski@gmail.com

## License

RMLStarReceiptPrinter is available under the MIT license. See the LICENSE file for more info.