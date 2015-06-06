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
#import "BKAlertButtonAction.h"

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

- (void)testIfPresenterUseNotOnlyOneAlertView
{
    [self.presenter show];
    UIAlertView* presentedAlert = [self alertFromPresenter];
    [self.presenter show];
    UIAlertView* secondPresentedAlert = [self alertFromPresenter];
    
    XCTAssertNotEqual(presentedAlert, secondPresentedAlert,@"Presenter should use different UIAlertView for each show");
}

- (void)testAddingOfButtonToAlertView
{
    [self addTestButtonToPresenter];
    XCTAssertTrue(self.presenter.buttons.count == 1,@"presenter should add button to array");
}
- (void)addTestButtonToPresenter
{
    [self.presenter addButtonWithTitle:@"Button1" action:^() {
        
    }];
}

- (void)testThatAddingButtonAddsButtonActionObject
{
    [self addTestButtonToPresenter];
    BKAlertButtonAction* buttonAction = [self.presenter.buttons firstObject];
    XCTAssertTrue([buttonAction isKindOfClass:[BKAlertButtonAction class]]);
}

- (void)testIfAddedActionHasRightTitleAndAction
{
    ButtonActionBlock buttonBlock = ^() {
    };
    [self.presenter addButtonWithTitle:@"Button Title" action:buttonBlock];
    BKAlertButtonAction* buttonAction = [self.presenter.buttons firstObject];

    XCTAssertEqual(buttonBlock, buttonAction.buttonAction);
    XCTAssertTrue([buttonAction.title isEqualToString:@"Button Title"]);
}

- (void)testIfAddedActionAddButtonOnAlertView
{
    ButtonActionBlock buttonBlock = ^() {
    };
    [self.presenter addButtonWithTitle:@"Button Title" action:buttonBlock];
    [self.presenter show];
    UIAlertView* presentedAlert = [self alertFromPresenter];

    XCTAssertEqual(presentedAlert.numberOfButtons,1);
    
}

- (void)testIfAddedActionCanBeCalledViaAlertDelegateMethods
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"Alert delegate should call button block of needed button"];
    ButtonActionBlock buttonBlock = ^() {
        [expectation fulfill];
    };
    
    [self.presenter addButtonWithTitle:@"Button1" action:buttonBlock];
    [self.presenter alertView:nil clickedButtonAtIndex:0];
    
    [self waitForExpectationsWithTimeout:1.0f handler:^(NSError *error) {
        
    }];
}

@end
