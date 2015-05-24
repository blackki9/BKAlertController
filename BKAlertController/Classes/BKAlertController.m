//
//  BKAlertController.m
//  BKAlertController
//
//  Created by black9 on 23/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKAlertController.h"

@implementation BKAlertController

- (instancetype)initWithTitle:(NSString*)title message:(NSString*)message
{
    if(self = [super init]) {
        _alertTitle = title;
        _alertMessage = message;
    }
    return self;
}

@end
