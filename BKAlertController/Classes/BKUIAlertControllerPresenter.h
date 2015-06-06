//
//  BKUIAlertControllerPresenter.h
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

@import UIKit;

#import <Foundation/Foundation.h>
#import "BKAlertPresenter.h"

@interface BKUIAlertControllerPresenter : NSObject <BKAlertPresenter>

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* message;
@property (nonatomic, strong) UIViewController* rootController;

@property (nonatomic, strong) NSMutableArray* buttons;

@end
