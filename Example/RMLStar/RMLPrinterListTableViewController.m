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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    self.refreshControl.backgroundColor = [UIColor purpleColor];
    self.refreshControl.tintColor = [UIColor whiteColor];
    [self.refreshControl addTarget:self
                            action:@selector(searchForPrinters)
                  forControlEvents:UIControlEventValueChanged];
    
    [self searchForPrinters];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchForPrinters {
    
    self.printers = [RMLStarReceiptPrinter availableDevices];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
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
    RMLStarReceiptPrinter *printer = [[RMLStarReceiptPrinter alloc] initWithDevice:device];
    
    [printer sendText:[NSString stringWithFormat:@"\n\n\nStarIO v%@\n\n\n\n\n", [RMLStarReceiptPrinter starIOVersion]]];
    
    [printer print];
}

@end
