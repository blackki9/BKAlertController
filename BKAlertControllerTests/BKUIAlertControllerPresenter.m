//
//  BKUIAlertControllerPresenter.m
//  BKAlertController
//
//  Created by black9 on 30/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BKUIAlertControllerPresenter.h"
#import "BKAlertButtonAction.h"

@interface BKUIAlertControllerPresenterTests : XCTestCase

@property (nonatomic, strong) BKUIAlertControllerPresenter* presenter;

@end

@implementation BKUIAlertControllerPresenterTests

- (void)setUp {
    [super setUp];
    self.presenter = [[BKUIAlertControllerPresenter alloc] init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatTitleAndMessageAreSetted
{
    self.presenter.title = @"Title";
    self.presenter.message = @"Message";
    
    XCTAssertEqual(self.presenter.title, @"Title");
    XCTAssertEqual(self.presenter.message, @"Message");
}

- (void)testThatShowPresenterCreateAlertController
{
    [self.presenter show];
    
    NSObject* alertController = [self.presenter valueForKey:@"currentAlert"];
    XCTAssertTrue([alertController isKindOfClass:[UIAlertController class]]);
}

- (void)testIfPresenterSetsTitleAndMessageToAlertController
{
    self.presenter.title = @"Title";
    self.presenter.message = @"Message";
    [self.presenter show];
    
    UIAlertController* alertController = [self.presenter valueForKey:@"currentAlert"];

    XCTAssertEqual(alertController.title,@"Title");
    XCTAssertEqual(alertController.message, @"Message");
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

- (void)testIfAlertControllerHasStyleAsAlertView
{
    [self.presenter show];
    UIAlertController* alertController = [self.presenter valueForKey:@"currentAlert"];
    XCTAssertEqual(alertController.preferredStyle, UIAlertControllerStyleAlert);
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

- (void)testIfAddedActionAddButtonOnAlertController
{
    ButtonActionBlock buttonBlock = ^() {
    };
    [self.presenter addButtonWithTitle:@"Button Title" action:buttonBlock];
    [self.presenter show];
    UIAlertController* alertController = [self.presenter valueForKey:@"currentAlert"];
    
    XCTAssertEqual(alertController.actions.count,1);
}

@end
