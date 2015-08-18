//
//  MockStackOverflowCommunicator.h
//  BrowseOverflow
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "StackOverflowCommunicator.h"

@interface MockStackOverflowCommunicator : StackOverflowCommunicator

-(BOOL)wasAskedToFetchQuestions;

@end
