//
//  Department.m
//  18_NSViewController
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "Department.h"
#import "Employee.h"

@implementation Department

// Insert code here to add functionality to your managed object subclass
- (void)addEmployeesObject:(Employee *)object{
    
    NSSet *s = [NSSet setWithObject:object];
    [self willChangeValueForKey:@"employees"
                withSetMutation:NSKeyValueUnionSetMutation
                   usingObjects:s];
    [[self primitiveValueForKey:@"employees"] addObject:object];
    [self didChangeValueForKey:@"employees"
               withSetMutation:NSKeyValueUnionSetMutation
                  usingObjects:s];
}
- (void)removeEmployeesObject:(Employee *)object{
    
    Employee *manager = [self manager];
    if (manager == object) {
        [self setManager:nil];
    }
    NSSet *s = [NSSet setWithObject:object];
    [self willChangeValueForKey:@"employees"
                withSetMutation:NSKeyValueMinusSetMutation
                   usingObjects:s];
    [[self primitiveValueForKey:@"employees"] removeObject:object];
    [self didChangeValueForKey:@"employees"
               withSetMutation:NSKeyValueMinusSetMutation
                  usingObjects:s];
}
@end
