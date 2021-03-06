//
//  BKAlertControllerTests.m
//  BKAlertControllerTests
//
//  Created by black9 on 23/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "InspectableBKAlertController.h"
#import "BKUIAlertViewPresenter.h"
#import "TestingBKAlertPresenter.h"

@interface BKAlertControllerTests : XCTestCase

@property (nonatomic, strong) InspectableBKAlertController* alertController;
@property (nonatomic, strong) InspectableBKAlertController* anotherAlertController;

@end

@implementation BKAlertControllerTests

- (void)setUp {
    self.alertController = [[InspectableBKAlertController alloc] initWithTitle:@"Title" message:@"Message" controller:[UIViewController new]];
    self.anotherAlertController = [[InspectableBKAlertController alloc] initWithTitle:@"Another title" message:@"Another message" controller:[UIViewController new]];

    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testAlertControllerCanBeCreated
{
    XCTAssertNotNil(self.alertController,@"We can create alert with title and message");
}

- (void)testAlertControllerSavesTitleAndMessage
{
    NSString* savedTitle = [self.alertController savedAlertTitle];
    NSString* savedMessage = [self.alertController savedAlertMessage];
    
    XCTAssertEqual(savedTitle, @"Title",@"alert controller should save its title");
    XCTAssertEqual(savedMessage, @"Message",@"Alert controller should save its message");
}

- (void)testAlertControllerWithDifferentTitle
{
    NSString* savedTitle = [self.anotherAlertController savedAlertTitle];
    NSString* savedMessage = [self.anotherAlertController savedAlertMessage];
    
    XCTAssertEqual(savedTitle, @"Another title",@"Alert controller should save different titles");
    XCTAssertEqual(savedMessage, @"Another message",@"Alert controller should save different messages");
}

- (void)testAlertControllerShowUIAlertViewIfVersionLessThan8
{
    [self.alertController setVersionToiOS7];
    [self.alertController show];
    Class classType = [[self.alertController currentTestPresenter] class];
    
    XCTAssertTrue([[self.alertController currentTestPresenter] isKindOfClass:classType]);
}

- (void)testAlertControllerCallShowMethodInAlertViewPresenter
{
    [self.alertController setVersionToiOS7];
    [self.alertController show];
    
    TestingBKAlertPresenter* presenter = (TestingBKAlertPresenter*)[self.alertController currentTestPresenter];
    XCTAssertTrue([presenter isShowWasCalled]);
}

- (void)testAlertControllerShowUIAlertControllerIfVersionEqualOfGreaterThan8
{
    [self.alertController setVersionToiOS8];
    [self.alertController show];
    Class classType = [[self.alertController currentTestPresenter] class];
    
    XCTAssertTrue([[self.alertController currentTestPresenter] isKindOfClass:classType]);
}

- (void)testThatAlertControllerPassButtonsToPresenter
{
    [self.alertController addButtonWithTitle:@"Title" action:^() {
    }];
    [self.alertController show];
    
    NSObject<BKAlertPresenter>* currentPresenter = [self.alertController currentTestPresenter];
    NSArray* buttons = [currentPresenter valueForKey:@"buttons"];
    
    XCTAssertEqual(buttons.count, 1);
}

@end
