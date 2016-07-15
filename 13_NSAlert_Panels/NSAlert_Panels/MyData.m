//
//  MyData.m
//  NSAlert_Panels
//
//  Created by 郭韬 on 15/11/2.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyData.h"

@implementation MyData

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.name = @"New Test";
        self.age  = 10;
    }
    return self;
}
@end
