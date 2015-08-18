//
//  Topic.m
//  BrowseOverflow
//
//  Created by mukum on 15/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@implementation Topic{
    NSArray *questions;
}

@synthesize name,tag;

-(id)initWithName:(NSString *)newName tag:(NSString *)newTag{
    if ((self = [super init])) {
        name = [newName copy];
         tag = [newTag copy];
        questions = [[NSArray alloc] init];
    }
    return self;
}

//-(NSArray*)recentQuestions{
//    //return questions;
//    NSArray *sortedQuestions = [questions sortedArrayUsingComparator:^(id obj1, id obj2) {
//        Question *q1 = (Question *)obj1;
//        Question *q2 = (Question *)obj2;
//        return [q2.date compare:q1.date];
//    }];//[NSArray array];
//    
//    if ([sortedQuestions count] < 21) {
//        return sortedQuestions;
//    }
//    else{
//        //returns a new array with a limit defined by the range
//        return [sortedQuestions subarrayWithRange:NSMakeRange(0, 20)];
//    }
//}

-(NSArray *)sortQuestionsLatestFirst:(NSArray *)questionList{
    return [questionList sortedArrayUsingComparator:^(id obj1, id obj2) {
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        return [q2.date compare:q1.date];
    }];
}

-(NSArray*)recentQuestions{
    return [self sortQuestionsLatestFirst:questions];
}

-(void)addQuestion:(Question *)question{
    NSArray *newQuestions = [questions arrayByAddingObject:question];
    if ([newQuestions count] > 20) {
        newQuestions = [self sortQuestionsLatestFirst:newQuestions];
        newQuestions = [newQuestions subarrayWithRange:NSMakeRange(0, 20)];
    }
    questions = newQuestions;
}

@end
