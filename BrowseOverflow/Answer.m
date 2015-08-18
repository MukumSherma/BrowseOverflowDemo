//
//  Answer.m
//  BrowseOverflow
//
//  Created by mukum on 16/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "Answer.h"

@implementation Answer

@synthesize accepted,score;

-(NSComparisonResult)compare:(Answer *)otherAnswer{ //order value
    
    if (accepted && !(otherAnswer.accepted)) {
        return NSOrderedAscending;
    }
    else if (!accepted && otherAnswer.accepted){
        return NSOrderedDescending;
    }
    
    if (score > otherAnswer.score) {
        return NSOrderedAscending;
    }
    else if (score < otherAnswer.score){
        return NSOrderedDescending;
    }
    else{
        return NSOrderedSame;
    }
}

@end
