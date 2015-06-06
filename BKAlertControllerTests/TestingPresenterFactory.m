//
//  TestingPresenterFactory.m
//  BKAlertController
//
//  Created by black9 on 29/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import "TestingPresenterFactory.h"
#import <objc/runtime.h>
#import "BKAlertPresenter.h"
#import "TestingBKAlertPresenter.h"

@implementation PresenterFactory (Testing)

+ (void)load
{
   static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(uialertViewPresenter);
        SEL swizzledSelector = @selector(testing_uialertViewPresenter);
        
        Method originalMethod = class_getClassMethod(class, originalSelector);
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        if(class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }
        else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
}

+ (NSObject<BKAlertPresenter>*)testing_uialertViewPresenter
{
    return [[TestingBKAlertPresenter alloc]init];
}

@end

@implementation TestingPresenterFactory

@end
