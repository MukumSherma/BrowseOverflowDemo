//
//  AnswerTests.m
//  AnswerTests
//
//  Created by mukum on 16/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Person.h"
#import "Answer.h"

@interface AnswerTests : XCTestCase{
    Answer *answer, *otherAnswer;
}

@end

@implementation AnswerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    answer = [[Answer alloc] init];
    answer.text = @"The answer is 42";
    answer.person = [[Person alloc] initWithName:@"Graham Lee" avatarLocation:@"http://example.com/avatar.png"];
    answer.score = 42;
    answer.accepted = NO;
    
    otherAnswer = [[Answer alloc] init];
    otherAnswer.text = @"I have the answer you need";
    otherAnswer.score = 42;
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    answer = nil;
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

-(void)testAnswerHasSomeText{
    XCTAssertEqualObjects(answer.text, @"The answer is 42");
}

-(void)testSomeoneProvidedTheAnswer{
    XCTAssertTrue([answer.person isKindOfClass:[Person class]]);
}

//answer.accepted = False/NO;
-(void)testAnswerNotAcceptedByDefault{
    XCTAssertFalse(answer.accepted,@"Answer is not accepted by default");
}

//if you change the value of BOOL "answer.accepted" , it doesn't throw any error
-(void)testAnswerCanBeAccepted{
    XCTAssertNoThrow(answer.accepted = YES,@"It is possible to accept an answer");
}

//True or False .... only 2 conditions. Check if answer.score = 42 is true //score 42 should be true
-(void)testAnswerHasAScore{
    XCTAssertTrue(answer.score = 42,@"Answer score can be retrieved");
}

-(void)testAcceptedAnswerComesBeforeUnaccepted{
    otherAnswer.accepted = YES;
    otherAnswer.score = answer.score + 10;
    
    XCTAssertEqual([answer compare:otherAnswer], NSOrderedDescending,@"Accepted answer should come first");
    XCTAssertEqual([otherAnswer compare:answer], NSOrderedAscending,@"Unaccepted answer should come last");
}

-(void)testAnswerWithEqualScoresCompareEqually{
    XCTAssertEqual([answer compare:otherAnswer], NSOrderedSame,@"Both answer of equal ranks");
    XCTAssertEqual([otherAnswer compare:answer], NSOrderedSame,@"Both answers has the same rank");
}

-(void)testLowerScoringAnswerComesAfterHigher{
    otherAnswer.score = answer.score + 10;
    XCTAssertEqual([answer compare:otherAnswer], NSOrderedDescending,@"Higher score comes first");
    XCTAssertEqual([otherAnswer compare:answer], NSOrderedAscending,@"Lower score comes last");
}

@end
