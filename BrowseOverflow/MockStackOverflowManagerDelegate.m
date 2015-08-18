//
//  MockStackOverflowManagerDelegate.m
//  BrowseOverflow
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"

@implementation MockStackOverflowManagerDelegate

@synthesize fetchError;

-(void)fetchQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error{
    self.fetchError = error;
}

@end
