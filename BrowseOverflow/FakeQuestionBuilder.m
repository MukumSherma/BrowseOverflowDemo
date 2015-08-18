//
//  FakeQuestionBuilder.m
//  BrowseOverflow
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "FakeQuestionBuilder.h"

@implementation FakeQuestionBuilder

@synthesize JSON,arrayToReturn,erroToSet;

-(NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error{
    self.JSON = objectNotation;
    return nil;
}

@end
