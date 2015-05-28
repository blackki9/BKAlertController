//
//  BKUIAlertViewPresenter.h
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BKAlertPresenter.h"
@import UIKit;

@interface BKUIAlertViewPresenter : NSObject <BKAlertPresenter,UIAlertViewDelegate>

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* message;

@end
