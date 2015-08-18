//
//  Question.h
//  BrowseOverflow
//
//  Created by mukum on 15/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Answer;

@interface Question : NSObject{
    NSMutableSet *answerSet;
}

@property (retain) NSDate *date;
@property (copy) NSString *title;
@property NSInteger score;
@property (readonly) NSArray *answers;

-(void)addAnswer:(Answer *)answer;

@end
