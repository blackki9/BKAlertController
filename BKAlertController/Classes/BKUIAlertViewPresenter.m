//
//  BKUIAlertViewPresenter.m
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKUIAlertViewPresenter.h"
#import "BKAlertButtonAction.h"

static NSMutableSet* allAlertPresenters;


@interface BKUIAlertViewPresenter()

@property (nonatomic, strong) UIAlertView* currentAlertView;

@end

@implementation BKUIAlertViewPresenter

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
    if(!allAlertPresenters) {
        allAlertPresenters = [NSMutableSet set];
    }
    if(![allAlertPresenters containsObject:self]) {
        [allAlertPresenters addObject:self];
    }

    self.currentAlertView = [[UIAlertView alloc] initWithTitle:self.title message:self.message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    for(BKAlertButtonAction* button in self.buttons) {
        [self.currentAlertView addButtonWithTitle:button.title];
    }
    
   [self.currentAlertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.currentAlertView = nil;
    if(self.buttons && self.buttons.count > buttonIndex) {
        BKAlertButtonAction* buttonBlock = self.buttons[buttonIndex];
        buttonBlock.buttonAction();
    }
    [allAlertPresenters removeObject:self];

}

- (void)addButtonWithTitle:(NSString*)title action:(ButtonActionBlock)action
{
    if(!self.buttons) {
        self.buttons = [NSMutableArray array];
    }
    
    [self.buttons addObject:[[BKAlertButtonAction alloc] initWithTitle:title action:action]];
}

@end
