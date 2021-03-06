//
//  PresenterFactory.h
//  BKAlertController
//
//  Created by black9 on 29/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKAlertPresenter.h"
@import UIKit;

@interface PresenterFactory : NSObject

+ (NSObject<BKAlertPresenter>*)uialertViewPresenter;
+ (NSObject<BKAlertPresenter>*)uialertControllerPresenterWithController:(UIViewController*)controller;

@end
