//
//  BKAlertPresenter.h
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#ifndef BKAlertController_BKAlertPresenter_h
#define BKAlertController_BKAlertPresenter_h

typedef void (^ButtonActionBlock) ();

@protocol BKAlertPresenter <NSObject>

- (void)setAlertTitle:(NSString*)title;
- (void)setAlertMessage:(NSString*)message;
- (void)show;
- (void)addButtonWithTitle:(NSString*)title action:(ButtonActionBlock)action;

@end

#endif
