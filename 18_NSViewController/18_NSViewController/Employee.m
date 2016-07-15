//
//  Employee.m
//  18_NSViewController
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "Employee.h"
#import "Department.h"

@implementation Employee

// Insert code here to add functionality to your managed object subclass

- (NSString *)fullName{
    
    NSString *first = self.fristName;
    NSString *last  = self.lastName;
    if (!first) {
        return last;
    }
    if (!last) {
        return first;
    }
    return [NSString stringWithFormat:@"%@%@",first,last];
}
//需要重载一个类方法，来指明在fullName的观察者获得值改变的消息
+ (NSSet *)keyPathsForValuesAffectingFullName{
    
    return [NSSet setWithObjects:@"fristName",@"lastName", nil];
}
@end
