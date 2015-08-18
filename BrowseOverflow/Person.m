//
//  Person.m
//  BrowseOverflow
//
//  Created by mukum on 16/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name,avatarURL;

-(id)initWithName:(NSString *)aName avatarLocation:(NSString *)location{
    
    if (self = [super init]) {
        name = [aName copy];
        avatarURL = [[NSURL alloc] initWithString:@"http://example.com/avatar/png"];
    }
    return self;

}

@end
