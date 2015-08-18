//
//  FakeQuestionBuilder.h
//  BrowseOverflow
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionBuilder.h"

@interface FakeQuestionBuilder : QuestionBuilder

@property (copy) NSString *JSON;
@property (copy) NSArray *arrayToReturn;
@property (copy) NSError *erroToSet;

-(NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error;

@end
