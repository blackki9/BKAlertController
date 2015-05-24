//
//  BKAlertControllerTests.m
//  BKAlertControllerTests
//
//  Created by black9 on 23/05/15.
//  Copyright (c) 2015 black9. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BKAlertController.h"
#import "InspectableBKAlertController.h"

@interface BKAlertControllerTests : XCTestCase

@property (nonatomic, strong) InspectableBKAlertController* alertController;
@property (nonatomic, strong) InspectableBKAlertController* anotherAlertController;

@end

@implementation BKAlertControllerTests

- (void)setUp {
    self.alertController = [[InspectableBKAlertController alloc] initWithTitle:@"Title" message:@"Message"];
    self.anotherAlertController = [[InspectableBKAlertController alloc] initWithTitle:@"Another title" message:@"Another message"];

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
    NSString* savedTitle = [self.alertController savedTitle];
    NSString* savedMessage = [self.alertController savedMessage];
    
    XCTAssertEqual(savedTitle, @"Title",@"alert controller should save its title");
    XCTAssertEqual(savedMessage, @"Message",@"Alert controller should save its message");
}

- (void)testAlertControllerWithDifferentTitle
{
    NSString* savedTitle = [self.anotherAlertController savedTitle];
    NSString* savedMessage = [self.anotherAlertController savedMessage];
    
    XCTAssertEqual(savedTitle, @"Another title",@"Alert controller should save different titles");
    XCTAssertEqual(savedMessage, @"Another message",@"Alert controller should save different messages");
}



@end
