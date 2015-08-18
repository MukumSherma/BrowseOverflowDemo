//
//  PersonTests.m
//  PersonTests
//
//  Created by mukum on 16/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Person.h"

@interface PersonTests : XCTestCase{
    Person *person;
}

@end

@implementation PersonTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    person = [[Person alloc] initWithName:@"Graham Lee" avatarLocation:@"http://example.com/avatar/png"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    person = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testThatPersonHasTheRightName{
    XCTAssertEqualObjects(person.name, @"Graham Lee",@"expecting a person to provide its name");
}

-(void)testThatPersonHasAnAvatarURL{
    NSURL *url = person.avatarURL;
    XCTAssertEqualObjects([url absoluteString], @"http://example.com/avatar/png",@"The Person avatar should be represented by a url");
}

@end
