//
//  BKAlertButtonAction.m
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKAlertButtonAction.h"

@implementation BKAlertButtonAction

- (instancetype)initWithTitle:(NSString*)title action:(ButtonActionBlock)action
{
    if(self = [super init]) {
        _title = [title copy];
        _buttonAction = action;
    }
    
    return self;
}

- (void)execute
{
    self.buttonAction();
}

@end
