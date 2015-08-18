//
//  QuestionBuilder.h
//  BrowseOverflow
//
//  Created by mukum on 18/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionBuilder : NSObject

-(NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error;

@end

extern NSString *QuestionBuilderErrorDomain;

enum {
    QuestionBuilderInvalidJSONError,
    QuestionBuilderMissingDataError,
};
