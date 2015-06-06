//
//  BKUIAlertControllerPresenter.m
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKUIAlertControllerPresenter.h"
#import "BKAlertButtonAction.h"

@interface BKUIAlertControllerPresenter()

@property (nonatomic, strong) UIAlertController* currentAlert;

@end

@implementation BKUIAlertControllerPresenter

- (void)setAlertTitle:(NSString*)title
{
    self.title = title;
}
- (void)setAlertMessage:(NSString*)message
{
    self.message = message;
}

- (void)show
{
    self.currentAlert = [UIAlertController alertControllerWithTitle:self.title
                                                            message:self.message
                                                     preferredStyle:UIAlertControllerStyleAlert];
    [self addButtonsToAlert];
    [self.rootController presentViewController:self.currentAlert animated:YES completion:nil];
}
- (void)addButtonsToAlert
{
    for(BKAlertButtonAction* buttonAction in self.buttons) {
        UIAlertAction* alertAction = [UIAlertAction actionWithTitle:buttonAction.title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            buttonAction.buttonAction();
        }];
        [self.currentAlert addAction:alertAction];
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
