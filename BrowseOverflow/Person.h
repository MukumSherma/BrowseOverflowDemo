//
//  Person.h
//  BrowseOverflow
//
//  Created by mukum on 16/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property NSURL *avatarURL;

-(id)initWithName:(NSString *)aName avatarLocation:(NSString *)location;
//this person
@end
