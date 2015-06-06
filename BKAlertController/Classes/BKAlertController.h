//
//  BKAlertController.h
//  BKAlertController
//
//  Created by black9 on 23/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKAlertButtonAction.h"
@import UIKit;

@interface BKAlertController : NSObject

- (instancetype)initWithTitle:(NSString*)title message:(NSString*)message controller:(UIViewController*)controller;
- (void)addButtonWithTitle:(NSString*)title action:(ButtonActionBlock)action;
- (void)show;

@end
