//
//  Person.m
//  9_NSArrayController
//
//  Created by 郭韬 on 15/10/28.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init{
    
    self = [super init];
    if (self) {
        personName = @"New Person";
        expectedRaise = 5.0;
    }
    return self;
}
@synthesize personName;
@synthesize expectedRaise;
@end
