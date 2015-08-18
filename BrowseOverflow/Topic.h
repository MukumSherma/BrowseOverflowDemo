//
//  Topic.h
//  BrowseOverflow
//
//  Created by mukum on 15/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Question;

@interface Topic : NSObject

//readonly because after the name is created, no need to change it anymore
@property (readonly) NSString *name;
@property (readonly) NSString *tag;

@property NSNumber *numObj;
@property int numPrimitiveScalar;

-(id)initWithName:(NSString *)newName tag:(NSString *)tag;
-(NSArray*)recentQuestions;
-(void)addQuestion:(Question *)question;

@end
