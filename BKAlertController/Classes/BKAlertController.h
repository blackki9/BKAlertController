//
//  BKAlertController.h
//  BKAlertController
//
//  Created by black9 on 23/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKAlertController : NSObject

@property (nonatomic,copy) NSString* alertTitle;
@property (nonatomic, copy) NSString* alertMessage;

- (instancetype)initWithTitle:(NSString*)title message:(NSString*)message;

@end
