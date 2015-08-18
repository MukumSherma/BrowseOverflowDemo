//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowCommunicator.h"
#import "Topic.h"
#import "QuestionBuilder.h"
#import "FakeQuestionBuilder.h"

extern NSString *StackOverflowManagerError;

enum {
    StackOverflowManagerErrorQuestionSearchCode
};

@protocol StackOverflowManagerDelegate <NSObject>

//-(void)fetchQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error;
-(void)fetchingQuestionsFailedWithError:(NSError *)error;
//-(void)receiveQuestions:(NSArray *)questions;
-(void)didReceiveQuestions:(NSArray *)questions;

@end

@interface StackOverflowManager : NSObject

@property (weak, nonatomic) id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;
@property (strong) QuestionBuilder *questionBuilder;

//-(void)fetchQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error;

-(void)seachingForQuestionsFailedWithError:(NSError *)error;
-(void)fetchQuestionsOnTopic:(Topic *)topic;
-(void)receivedQuestionsJSON:(NSString *)objectNotation;

@end
