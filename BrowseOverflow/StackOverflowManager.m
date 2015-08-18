//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "StackOverflowManager.h"

NSString *StackOverflowManagerError = @"StackOverflowManagerError";

@interface StackOverflowManager ()
- (void)tellDelegateAboutQuestionSearchError: (NSError *)underlyingError;
@end

@implementation StackOverflowManager

@synthesize delegate,communicator,questionBuilder;

//only changing the setter method , it must be (weak, nonatomic) type
-(void)setDelegate:(id<StackOverflowManagerDelegate>)newDelegate{
    
    if (newDelegate && ![newDelegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)]) {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate object doesn't conform to delegate protocol" userInfo:nil] raise]; //program flow jumps to local exception handler
    }
    delegate = newDelegate;
}

-(void)fetchQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error{
    [communicator searchForQuestionsWithTag:[topic tag]];
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error {
    [self tellDelegateAboutQuestionSearchError: error];
}

//-(void)seachingForQuestionsFailedWithError:(NSError *)error{
//    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
//    NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerError code:StackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
////    NSError *reportableError = [NSError errorWithDomain:StackOverflowSearchFailedError code:StackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
//    //[delegate fetchQuestionsOnTopic:nil failedWithError:reportableError];
//    [delegate fetchingQuestionsFailedWithError:reportableError];
//}

-(void)fetchQuestionsOnTopic:(Topic *)topic{
    [communicator searchForQuestionsWithTag: [topic tag]];
}

-(void)receivedQuestionsJSON:(NSString *)objectNotation{
    NSError *error = nil;
    questionBuilder = [QuestionBuilder new];
    NSArray *questions = [questionBuilder questionsFromJSON:objectNotation error:&error];
    
    if (!questions) {
        [self tellDelegateAboutQuestionSearchError:error];
    }
    else{
        [delegate didReceiveQuestions:questions];
    }
}

-(void)tellDelegateAboutQuestionSearchError:(NSError *)underlyingError{
    NSDictionary *errorInfo = nil;
    if (underlyingError) {
        errorInfo = [NSDictionary dictionaryWithObject: underlyingError forKey: NSUnderlyingErrorKey];
    }
    NSError *reportableError = [NSError errorWithDomain: StackOverflowManagerError code: StackOverflowManagerErrorQuestionSearchCode userInfo: errorInfo];
    [delegate fetchingQuestionsFailedWithError:reportableError];
}




//        NSDictionary *errorInfo = nil;
//        if (error) {
//            errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
//        }
//        NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerError code:StackOverflowManagerErrorQuestionSearchCode userInfo:[NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey]];
//        [delegate fetchingQuestionsFailedWithError:reportableError];
 //   }


@end
