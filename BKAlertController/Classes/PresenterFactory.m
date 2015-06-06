//
//  PresenterFactory.m
//  BKAlertController
//
//  Created by black9 on 29/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "PresenterFactory.h"
#import "BKUIAlertViewPresenter.h"
#import "BKUIAlertControllerPresenter.h"

@implementation PresenterFactory

+ (NSObject<BKAlertPresenter>*)uialertViewPresenter
{
    return [[BKUIAlertViewPresenter alloc] init];
}

+ (NSObject<BKAlertPresenter>*)uialertControllerPresenter
{
    return [[BKUIAlertControllerPresenter alloc] init];
}


@end
