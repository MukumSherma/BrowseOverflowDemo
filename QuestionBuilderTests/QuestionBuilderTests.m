//
//  QuestionBuilderTests.m
//  QuestionBuilderTests
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#include "Question.h"
#import "QuestionBuilder.h"

@interface QuestionBuilderTests : XCTestCase{
    QuestionBuilder *questionBuilder;
    Question *question;
}

@end

@implementation QuestionBuilderTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    questionBuilder = [[QuestionBuilder alloc] init];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    questionBuilder = nil;
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

-(void)testThatNilIsNotAnAcceptableParameter{
    XCTAssertThrows([questionBuilder questionsFromJSON:nil error:NULL],@"Lack of data should have been handled elsewhere");
    //XCTAssertThrows([questionBuilder questionFromJSON:nil error:NULL],@"Lack of data should have been handled elsewhere");
}

-(void)testNilReturnWhenStringIsNotJSON{
    XCTAssertNil([questionBuilder questionsFromJSON:@"Not JSON" error:NULL],@"This parameter should not be parsable");
    //XCTAssertNil([questionBuilder questionFromJSON:@"Not JSON" error:NULL],@"This parameter should not be parsable");
}

//-(void)testErrorSetWhenStringIsNotJSON{
//    NSError *error = nil;
//    [questionBuilder questionsFromJSON:@"Not JSON" error:&error];
//    //[questionBuilder questionsFromJSON:@"Not JSON" error:&error];
//    XCTAssertNotNil(error,@"An error occurred, we should be told");
//}

@end
