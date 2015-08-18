//
//  QuestionsTests.m
//  QuestionsTests
//
//  Created by mukum on 15/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Question.h"
#import "Answer.h"

@interface QuestionsTests : XCTestCase{
    Question *question;
    Answer *lowScore;
    Answer *highScore;
}

@end

@implementation QuestionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    question = [[Question alloc]init];
    question.date = [NSDate distantPast];
    question.title = @"Do iPhone also dream of electric sheep";
    question.score = 42;
    
    Answer *accepted = [[Answer alloc] init];
    accepted.score = 1;
    accepted.accepted = YES;
    [question addAnswer:accepted];
    
    lowScore = [[Answer alloc] init];
    lowScore.score = -4;
    [question addAnswer:lowScore];
    
    highScore = [[Answer alloc] init];
    highScore.score = 4;
    [question addAnswer:highScore];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    question = nil;
    lowScore = nil;
    highScore = nil;
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

-(void)testQuestionHasADate{
    NSDate *testDate = [NSDate distantPast];
    question.date = testDate;
    XCTAssertEqualObjects(question.date, testDate,@"Question needs to provide its date");

}

-(void)testQuestionsKeepScore{
    XCTAssertEqual(question.score, 42, @"Question needs a numeric score");
}

-(void)testQuestionHasATitle{
    XCTAssertEqualObjects(question.title, @"Do iPhone also dream of electric sheep", @"Question needs a title");
}

-(void)testQuestionCanHaveAnswersAdded{
    Answer *myAnswer = [[Answer alloc] init];
    XCTAssertNoThrow([question addAnswer:myAnswer]);
}

-(void)testAcceptedAnswerIsFirst{
    XCTAssertTrue([[question.answers objectAtIndex:0] isAccepted],@"Accepted answers come first");
}

-(void)testHighScoreAnswerBeforeLoa{
    NSArray *answers = question.answers;
    NSInteger highIndex = [answers indexOfObject:highScore];
    NSInteger lowIndex = [answers indexOfObject:lowScore];
    XCTAssertTrue(highIndex < lowIndex,@"High-scoring answer comes first");
}


@end
