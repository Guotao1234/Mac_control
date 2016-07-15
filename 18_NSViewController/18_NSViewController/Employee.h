//
//  Employee.h
//  18_NSViewController
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Department;

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
@property (nonatomic,readonly)NSString *fullName;

@end

NS_ASSUME_NONNULL_END

#import "Employee+CoreDataProperties.h"
