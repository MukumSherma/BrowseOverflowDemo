//
//  TopicTests.m
//  TopicTests
//
//  Created by mukum on 15/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Topic.h"
#import "Question.h"

@interface TopicTests : XCTestCase{
    Topic *topic;
}

@end

@implementation TopicTests

- (void)setUp {
    [super setUp];
    topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iPhone"];
    topic.numPrimitiveScalar = 10;
    topic.numObj = @10;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    topic = nil;
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

//test whether the topic class exists or not
-(void)testThatTopicExists{
    XCTAssertNotNil(topic,@"Should be able to create a topic instance");
}

-(void)testNumPrimitiveScalar{
    XCTAssertEqual(topic.numPrimitiveScalar, 10);
    //...###...for primitive data types called scalars, use XCTAssertEqual (eg. int, float), not XCTAssertEqualObjects (for objects like NSNumber, NSString etc)
}

-(void)testDiffIsAccurate{
    XCTAssertEqualWithAccuracy(10, 10, 44,@"Diff is not accurate");
}

-(void)testNumObj{
    XCTAssertEqualObjects(topic.numObj, @10);
}

-(void)testThatTopicCanBeNamed{
    XCTAssertEqualObjects(topic.name, @"iPhone",@"the topic should have the name I gave it");
}

-(void)testThatTopicHasATag{
    XCTAssertEqualObjects(topic.tag, @"iPhone",@"the Topic should have the tag I gave it");
}

-(void)testForAListOfQuestions{
    XCTAssertTrue([[topic recentQuestions] isKindOfClass:[NSArray class]],@"Topic should provide a list of questions");
}

-(void)testForInitiallyEmptyQuestionList{
    XCTAssertEqual([[topic recentQuestions] count], (NSUInteger)0,@"No Question add yer, count should be zero");
}

-(void)testAddedQuestionToTheList{
    Question *question = [Question new];
    [topic addQuestion:question];
    XCTAssertEqual([[topic recentQuestions] count], (NSUInteger)1,@"Add a question, and the count of questions should go up");
}

-(void)testQuesitionsAreListedChronologically{
    Question *q1 = [[Question alloc] init];
    q1.date = [NSDate distantPast];
    
    Question *q2 = [[Question alloc] init];
    q2.date = [NSDate distantPast];
    
    [topic addQuestion:q1];
    [topic addQuestion:q2];
    
    NSArray *questions = [topic recentQuestions];
    Question *listedFirst = [questions objectAtIndex:0];
    Question *listedSecond = [questions objectAtIndex:1];
    
    //listedFirst.date is later than listedSecond.date
    XCTAssertEqualObjects([listedFirst.date laterDate:listedSecond.date],listedFirst.date, @"The later question should appear in the list");
}

-(void)testLimitOfTwentyQuestions{
    Question *q1 = [[Question alloc] init];
    for (NSInteger i = 0; i < 25; i++) { //supply 25 questions to check limit of 21 questions
        [topic addQuestion:q1];
    }
    XCTAssertTrue([[topic recentQuestions] count] < 21, @"There should never be more than twenty questions");
}







//

@end
