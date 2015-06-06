//
//  BKAlertButtonAction.h
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKAlertPresenter.h"

@interface BKAlertButtonAction : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, strong) ButtonActionBlock buttonAction;

- (instancetype)initWithTitle:(NSString*)title action:(ButtonActionBlock)action;

- (void)execute;

@end
