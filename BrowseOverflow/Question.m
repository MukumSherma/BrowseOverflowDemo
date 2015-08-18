//
//  Question.m
//  BrowseOverflow
//
//  Created by mukum on 15/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize date,title,score;

-(id)init{
    if (self = [super init]) {
        answerSet = [[NSMutableSet alloc] init];
    }
    return self;
}

-(void)addAnswer:(Answer *)answer{
    [answerSet addObject:answer];
}

-(NSArray *) answers{
    return [[answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
