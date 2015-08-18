//
//  MockStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"

@implementation MockStackOverflowCommunicator{
    BOOL wasAskedToFetchQuestions;
}

-(void)searchForQuestionsWithTag:(NSString *)tag{
    wasAskedToFetchQuestions = YES;
}

-(BOOL)wasAskedToFetchQuestions{
    return wasAskedToFetchQuestions;
}



@end
