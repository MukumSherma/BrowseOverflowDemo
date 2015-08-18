//
//  QuestionBuilder.m
//  BrowseOverflow
//
//  Created by mukum on 18/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "QuestionBuilder.h"

@implementation QuestionBuilder

-(NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error{
    NSParameterAssert(objectNotation != nil);
    if (error != nil) {
        //*error = [NSError errorWithDomain:QuestionBuilderErrorDomain code:QuestionBuilderInvalidJSONError userInfo:nil];
    }
    return nil;
}

@end


NSString *QuestionBuilderErrorDomain = @"QuestionBuilderErrorDomain";
