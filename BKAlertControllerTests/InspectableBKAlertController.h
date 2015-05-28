//
//  InspectableBKAlertController.h
//  BKAlertController
//
//  Created by black9 on 24/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKAlertController.h"
#import "BKAlertPresenter.h"

@interface InspectableBKAlertController : BKAlertController

- (NSString*)savedAlertTitle;
- (NSString*)savedAlertMessage;

- (void)setVersionToiOS7;
- (void)setVersionToiOS8;

- (NSObject<BKAlertPresenter>*)currentTestPresenter;

@end
