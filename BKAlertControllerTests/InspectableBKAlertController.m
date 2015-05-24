//
//  InspectableBKAlertController.m
//  BKAlertController
//
//  Created by black9 on 24/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "InspectableBKAlertController.h"

@implementation InspectableBKAlertController

- (NSString*)savedTitle
{
    return self.alertTitle;
}

- (NSString*)savedMessage
{
    return self.alertMessage;
}

@end
