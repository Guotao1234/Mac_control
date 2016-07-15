//
//  Person.m
//  10_NSUndoManager
//
//  Created by 郭韬 on 15/10/29.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init{
    self = [super init];
    expectedRaise = 5.0;
    personName = @"New Person";
    return self;
}

@synthesize personName;
@synthesize expectedRaise;
@end
