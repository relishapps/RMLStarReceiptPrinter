//
//  RMLViewController.m
//  RMLStarReceiptPrinter
//
//  Created by Pawel Decowski on 08/10/2015.
//  Copyright (c) 2015 Pawel Decowski. All rights reserved.
//

#import "RMLViewController.h"
#import "RMLStarReceiptPrinter.h"

@interface RMLViewController ()

@property (weak, nonatomic) IBOutlet UILabel *versionLabel;

@end

@implementation RMLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    RMLStarReceiptPrinter *printer = [RMLStarReceiptPrinter new];
    
    if ([printer status] == RMLStarReceiptPrinterStatusOffline) {
        [printer setTextAlignment:RMLStarReceiptPrinterTextAlignmentCenter];
        [printer setCharacterExpansion:RMLStarReceiptPrinterCharacterExpansionSingleWidthDoubleHeight];
    }
    
    [printer sendText:[NSString stringWithFormat:@"StarIO v%@", [RMLStarReceiptPrinter starIOVersion]]];
    
    self.versionLabel.text = [NSString stringWithFormat:@"StarIO v%@", [RMLStarReceiptPrinter starIOVersion]];
}

@end
