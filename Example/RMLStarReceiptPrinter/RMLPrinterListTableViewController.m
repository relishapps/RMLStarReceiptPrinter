//
//  RMLPrinterListTableViewController.m
//  RMLStarReceiptPrinter
//
//  Created by Dan Sinclair on 14/08/2015.
//  Copyright (c) 2015 Pawel Decowski. All rights reserved.
//

#import "RMLPrinterListTableViewController.h"

@interface RMLPrinterListTableViewController ()

@property NSArray *printers;

@end

@implementation RMLPrinterListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor colorWithRed:189.0/255.0 green:21.0/255.0 blue:80.0/255.0 alpha:1.0];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(searchForPrinters)
                  forControlEvents:UIControlEventValueChanged];
    
    [self searchForPrinters];
}

- (void)searchForPrinters {
    self.tableView.backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    self.printers = [RMLStarReceiptPrinter availableDevices];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (IBAction)showInfo:(UIBarButtonItem *)sender {
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSString *about = [NSString stringWithFormat:@"RMLStarReceiptPrinter v%@\n\n(c) 2014–2018 Relish Media Ltd\n\nhttps://relishapps.com", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"About" message:about preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *web = [UIAlertAction actionWithTitle:@"Visit website" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://relishapps.com"]];
    }];
    [alert addAction:web];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    if (self.printers.count > 0) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        return 1;
    } else {
        // Display a message when the table is empty
        UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        messageLabel.text = @"No printers found. Please pull down to refresh.";
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = NSTextAlignmentCenter;
        messageLabel.font = [UIFont systemFontOfSize:20];
        [messageLabel sizeToFit];
        
        self.tableView.backgroundView = messageLabel;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.printers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    RMLStarReceiptPrinterDevice *device = self.printers[indexPath.row];
    
    cell.textLabel.text = device.portName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", device.modelName, device.macAddress];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self printWithDevice:self.printers[indexPath.row]];
}

- (void)printWithDevice:(RMLStarReceiptPrinterDevice *)device {
    NSLog(@"StarIO SDK version: %@", [RMLStarReceiptPrinter starIOVersion]);
    NSLog(@"Device: %@", device.modelName);
    RMLStarReceiptPrinter *printer = [[RMLStarReceiptPrinter alloc] initWithDevice:device];
    
    NSLog(@"Printer: %@", printer);
    
    [printer setTextAlignment:RMLStarReceiptPrinterTextAlignmentCenter];
    
    [printer setTextEmphasis:RMLStarReceiptPrinterTextEmphasisOn];
    
    [printer sendText:@"Hello, world!\n\n"];
    
    [printer setTextEmphasis:RMLStarReceiptPrinterTextEmphasisOff];
    
    [printer sendText:[NSString stringWithFormat:@"\n\nRMLStarReceiptPrinter v%@\n\n(c) 2014-2018 Relish Media Ltd\n\nhttps://relishapps.com\n\n\n\n\n", [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]]];
    
    [printer print];
}

@end
