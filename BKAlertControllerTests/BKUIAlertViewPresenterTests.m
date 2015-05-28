//
//  BKUIAlertViewPresenterTests.m
//  BKAlertController
//
//  Created by black9 on 28/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

@import UIKit;

#import <XCTest/XCTest.h>
#import "BKUIAlertViewPresenter.h"

#define ALERT_PROPERTY_KEY @"currentAlertView"

@interface BKUIAlertViewPresenterTests : XCTestCase

@property (nonatomic, strong) BKUIAlertViewPresenter* presenter;

@end

@implementation BKUIAlertViewPresenterTests

- (void)setUp {
    [super setUp];

    self.presenter = [[BKUIAlertViewPresenter alloc] init];
}

- (void)tearDown {
    [super tearDown];
    
    self.presenter = nil;
}

- (void)testThatTitleAndMessageAreSetted
{
    self.presenter.title = @"Title";
    self.presenter.message = @"Message";
    
    XCTAssertEqual(self.presenter.title, @"Title");
    XCTAssertEqual(self.presenter.message, @"Message");
}

- (void)testThatPresenterIsDelegateOfUIAlertView
{
    XCTAssertTrue([self.presenter conformsToProtocol:@protocol(UIAlertViewDelegate)]);
}

- (void)testIfPresenterImplementClickButtonDelegateMethod
{
    XCTAssertNoThrow([self.presenter alertView:nil clickedButtonAtIndex:0]);
}

- (void)testIfPresenterCreatesUIAlertObjectToShow
{
    [self.presenter show];
    XCTAssertNotNil([self.presenter valueForKey:ALERT_PROPERTY_KEY]);
}

- (void)testIfPresenterSetTitleAndMessageToAlertView
{
    self.presenter.title = @"Title";
    self.presenter.message = @"Message";
    
    [self.presenter show];
    
    UIAlertView* presentedAlert = [self alertFromPresenter];

    XCTAssertTrue([self.presenter.title isEqualToString:presentedAlert.title]);
    XCTAssertEqual(self.presenter.message, presentedAlert.message);
}
- (UIAlertView*)alertFromPresenter
{
    return [self.presenter valueForKey:ALERT_PROPERTY_KEY];
}

- (void)testIfPresenterSetSelfAsDelegateToAlertView
{
    [self.presenter show];
    UIAlertView* presentedAlert = [self alertFromPresenter];
    
    XCTAssertEqual(self.presenter, presentedAlert.delegate);
}


@end
