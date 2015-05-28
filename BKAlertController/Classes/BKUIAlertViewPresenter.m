//
//  BKUIAlertViewPresenter.m
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKUIAlertViewPresenter.h"

@interface BKUIAlertViewPresenter()

@property (nonatomic, strong) UIAlertView* currentAlertView;

@end

@implementation BKUIAlertViewPresenter

- (void)show
{
    self.currentAlertView = [[UIAlertView alloc] initWithTitle:self.title message:self.message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
   [self.currentAlertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
}

@end
