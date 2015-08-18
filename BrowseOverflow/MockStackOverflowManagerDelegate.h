//
//  MockStackOverflowManagerDelegate.h
//  BrowseOverflow
//
//  Created by mukum on 17/8/15.
//  Copyright (c) 2015 mukum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowManager.h"

@interface MockStackOverflowManagerDelegate : NSObject<StackOverflowManagerDelegate>

@property (strong) NSError *fetchError;

@end
