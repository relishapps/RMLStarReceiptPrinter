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
    
    [printer sendText:[NSString stringWithFormat:@"StarIO v%@", [SMPort StarIOVersion]]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
