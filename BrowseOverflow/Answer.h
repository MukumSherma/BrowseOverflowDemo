//
//  Answer.h
//  BrowseOverflow
//
//  Created by mukum on 16/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Answer : NSObject

@property NSString *text;
@property Person *person;
@property int score;
@property (getter=isAccepted) BOOL accepted; //getter = isAccepted //getter method //or setter = accepted//

-(NSComparisonResult)compare:(Answer *)otherAnswer;

@end
