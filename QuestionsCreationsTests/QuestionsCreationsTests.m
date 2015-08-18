//
//  QuestionsCreationsTests.m
//  QuestionsCreationsTests
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "StackOverflowManager.h"
#import "Topic.h"
#import "MockStackOverflowCommunicator.h"
#import "MockStackOverflowManagerDelegate.h"
#import "FakeQuestionBuilder.h"
#import "QuestionBuilder.h"
#import "Question.h"

@interface QuestionsCreationsTests : XCTestCase{
    @private
        StackOverflowManager *mgr;
        MockStackOverflowManagerDelegate *delegate;
        NSError *underlyingError;
        NSArray *questionArray;
        FakeQuestionBuilder *questionBuilder;
        MockStackOverflowCommunicator *communicator;
}

@end

@implementation QuestionsCreationsTests
//Hey
- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    mgr = [[StackOverflowManager alloc] init];
    delegate = [[MockStackOverflowManagerDelegate alloc] init];
    mgr.delegate = delegate;
    underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
    
    Question *question = [[Question alloc] init];
    questionArray = [NSArray arrayWithObject:question];
    
    questionBuilder = [FakeQuestionBuilder new];
    questionBuilder.arrayToReturn = nil;
    mgr.questionBuilder = questionBuilder;
    
    communicator = [[MockStackOverflowCommunicator alloc] init];
    mgr.communicator = communicator;
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    mgr = nil;
    delegate = nil;
    underlyingError = nil;
    questionArray = nil;
    
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

-(void)testNonConformingObjectCannotBeDelegate{
    XCTAssertThrows(mgr.delegate = (id<StackOverflowManagerDelegate>)[NSNull null],@"NSNull should not be used as the delegate as doesn't conform to the delegate protocol");
}

-(void)testConformingObjectCanBeDelegate{
    id<StackOverflowManagerDelegate> delegate = [[MockStackOverflowManagerDelegate alloc] init];
    XCTAssertNoThrow(mgr.delegate = delegate, @"Object conforming to the delegate protocol should be used as the delegate");
}

-(void)testManagerAcceptsNilAsADelegate{
    XCTAssertNoThrow(mgr.delegate = nil, @"It should be acceptable to use nil as an object's delegate");
}

-(void)testAskingForQuestionsMeansRequestingData{
//    MockStackOverflowCommunicator *communicator = [[MockStackOverflowCommunicator alloc] init];
//    mgr.communicator = communicator;
    Topic *topic = [[Topic alloc] initWithName:@"iPhone" tag:@"iPhone"];
    [mgr fetchQuestionsOnTopic:topic];
    XCTAssertTrue([communicator wasAskedToFetchQuestions],@"The communicator should need to fetch data");
}

-(void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator{
//    MockStackOverflowManagerDelegate *delegate = [[MockStackOverflowManagerDelegate alloc] init];
//    mgr.delegate = delegate;
//    NSError *underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
    [mgr seachingForQuestionsFailedWithError:underlyingError];
    //[mgr seachingForQuestionsFailedWithError:underlyingError];
    XCTAssertFalse(underlyingError == [delegate fetchError],@"Error should be at the correct level of abstraction");
}

-(void)testErrorReturnedToDelegateDocumentasUnderlyingError{
//    MockStackOverflowManagerDelegate *delegate = [[MockStackOverflowManagerDelegate alloc] init];
//    mgr.delegate = delegate;
//    NSError *underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
    [mgr seachingForQuestionsFailedWithError:underlyingError];
    XCTAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey],underlyingError,@"The underlying error should be available to client code");
}

-(void)testQuestionJSONIsPassedToQuestionBuilder{
//    FakeQuestionBuilder *builder = [[FakeQuestionBuilder alloc] init];
//    mgr.questionBuilder = builder;
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    XCTAssertEqualObjects(questionBuilder.JSON,@"Fake JSON",@"Downloaded JSON is sent to the builder");
    mgr.questionBuilder = nil;
}

-(void)testDelegateNotifiedOfErrorWhenQuestionBuilderFails{
//    FakeQuestionBuilder *builder = [[FakeQuestionBuilder alloc] init];
//    builder.arrayToReturn = nil;
//    builder.erroToSet = underlyingError;
//    mgr.questionBuilder = builder;
    [mgr receivedQuestionsJSON:@"Fake JSOn"];
    XCTAssertNotNil([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey],@"The delegate should have found out about the error");
    mgr.questionBuilder = nil;
}


//-(void)testDelegateNotToldAboutErrorWhenQuestionReceived{
//    questionBuilder.arrayToReturn = questionArray;
//    [mgr receivedQuestionsJSON:@"Fake JSON"];
//    XCTAssertNil([delegate fetchError],@"No error should be received on success");
//}

//-(void)testDelegateReceivesTheQuestionsDiscoveredByManager{
//    questionBuilder.arrayToReturn = questionArray;
//    [mgr receivedQuestionsJSON:@"Fake JSON"];
//    XCTAssertEqualObjects([delegate receiveQuestions:<#(NSArray *)#> receivedQuestions], questionArray,@"The manager should have sent its question to the delegate");
//}
//
//
//-(void)testEmptyArrayIsPassedToDelegate{
//    questionBuilder.arrayToReturn = [NSArray array];
//    [mgr receivedQuestionsJSON:@"Fake JSON"];
//    XCTAssertEqualObjects([delegate receivedQuestions], [NSArray array],@"Returning an empty array is not an error");
//}
//


@end































//
