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
#import "PresenterFactory.h"

@import UIKit;

@interface BKAlertController()

@property (nonatomic,copy,readonly) NSString* alertTitle;
@property (nonatomic, copy,readonly) NSString* alertMessage;
@property (nonatomic, strong) NSMutableArray* buttons;
@property (nonatomic, strong) UIViewController* rootController;

@property (nonatomic, strong) NSObject<BKAlertPresenter>* currentPresenter;

@property (nonatomic, copy) NSString* currentiOSVersion;

@end

@implementation BKAlertController

- (instancetype)initWithTitle:(NSString*)title message:(NSString*)message controller:(UIViewController*)controller;
{
    if(self = [super init]) {
        _alertTitle = [title copy];
        _alertMessage = [message copy];
        _rootController = controller;
        self.currentiOSVersion = [[UIDevice currentDevice] systemVersion];
    }
    return self;
}

- (void)show
{
    [self setupPresenter];
    [self.currentPresenter show];
}
- (void)setupPresenter
{
    if(!_currentPresenter) {
        if([self isiOSLessThan8]) {
            [self setupAlertView];
        }
        else {
            [self setupAlertController];
        }
        
        [self.currentPresenter setAlertTitle:self.alertTitle];
        [self.currentPresenter setAlertMessage:self.alertMessage];
        
        [self addButtonsToPresenter];
    }
}
- (BOOL)isiOSLessThan8
{
    return [self.currentiOSVersion floatValue] < 8.0f;
}
- (void)setupAlertView
{
    if(!self.currentPresenter) {
        self.currentPresenter = [PresenterFactory uialertViewPresenter];
    }
}
- (void)setupAlertController
{
    if(!self.currentPresenter) {
        self.currentPresenter = [PresenterFactory uialertControllerPresenterWithController:self.rootController];
    }
}
- (void)addButtonsToPresenter
{
    for(BKAlertButtonAction* action in self.buttons) {
        [self.currentPresenter addButtonWithTitle:action.title action:action.buttonAction];
    }
}
- (void)addButtonWithTitle:(NSString*)title action:(ButtonActionBlock)action
{
    if(!self.buttons) {
        self.buttons = [NSMutableArray array];
    }
    
    [self.buttons addObject:[[BKAlertButtonAction alloc] initWithTitle:title action:action]];
}

@end
