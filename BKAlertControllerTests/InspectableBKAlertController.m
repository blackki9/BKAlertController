//
//  InspectableBKAlertController.m
//  BKAlertController
//
//  Created by black9 on 24/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "InspectableBKAlertController.h"

@implementation InspectableBKAlertController

- (NSString*)savedAlertTitle
{
    return [self valueForKey:@"alertTitle"];
}
- (NSString*)savedAlertMessage
{
    return [self valueForKey:@"alertMessage"];
}

- (void)setVersionToiOS7
{
    return [self setValue:@"7.0" forKey:@"currentiOSVersion"];
}

- (void)setVersionToiOS8
{
    return [self setValue:@"8.0" forKey:@"currentiOSVersion"];    
}

- (NSObject<BKAlertPresenter>*)currentTestPresenter
{
    return [self valueForKey:@"currentPresenter"];
}

@end
