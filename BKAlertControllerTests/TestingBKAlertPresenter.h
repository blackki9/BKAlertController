//
//  TestingBKAlertPresenter.h
//  BKAlertController
//
//  Created by black9 on 29/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "BKUIAlertViewPresenter.h"

@interface TestingBKAlertPresenter : BKUIAlertViewPresenter

@property (nonatomic, assign,getter = isShowWasCalled) BOOL showWasCalled;

@end
