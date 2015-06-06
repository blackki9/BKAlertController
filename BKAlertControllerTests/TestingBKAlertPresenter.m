//
//  TestingBKAlertPresenter.m
//  BKAlertController
//
//  Created by black9 on 29/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "TestingBKAlertPresenter.h"

@implementation TestingBKAlertPresenter

- (void)show
{
    [super show];
    self.showWasCalled = YES;
}

@end
