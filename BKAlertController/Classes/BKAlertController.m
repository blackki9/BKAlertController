//
//  BKAlertController.m
//  BKAlertController
//
//  Created by black9 on 23/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKAlertController.h"
#import "BKUIAlertViewPresenter.h"
#import "BKUIAlertControllerPresenter.h"

@import UIKit;

@interface BKAlertController()

@property (nonatomic,copy,readonly) NSString* alertTitle;
@property (nonatomic, copy,readonly) NSString* alertMessage;

@property (nonatomic, strong) NSObject<BKAlertPresenter>* currentPresenter;

@property (nonatomic, copy) NSString* currentiOSVersion;

@end

@implementation BKAlertController

- (instancetype)initWithTitle:(NSString*)title message:(NSString*)message
{
    if(self = [super init]) {
        _alertTitle = [title copy];
        _alertMessage = [message copy];
        self.currentiOSVersion = [[UIDevice currentDevice] systemVersion];
    }
    return self;
}

- (void)show
{
    if([self isiOSLessThan8]) {
        [self showAlertView];
    }
    else {
        [self showAlertController];
    }
}
- (BOOL)isiOSLessThan8
{
    return [self.currentiOSVersion floatValue] < 8.0f;
}
- (void)showAlertView
{
    self.currentPresenter = [[BKUIAlertViewPresenter alloc] init];
}
- (void)showAlertController
{
    self.currentPresenter = [[BKUIAlertControllerPresenter alloc] init];
}

@end
