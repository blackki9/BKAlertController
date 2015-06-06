//
//  ViewController.m
//  BKAlertController
//
//  Created by black9 on 23/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "ViewController.h"
#import "BKAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showAlertView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlertView
{
    BKAlertController* alertView = [[BKAlertController alloc] initWithTitle:@"Title" message:@"Message" controller:self];
    [alertView addButtonWithTitle:@"Action" action:^{
        NSLog(@"Action clicked");
    }];
    [alertView show];
}

@end
