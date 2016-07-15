//
//  Department+CoreDataProperties.h
//  18_NSViewController
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Department.h"

NS_ASSUME_NONNULL_BEGIN

@interface Department (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *deptName;
@property (nullable, nonatomic, retain) Employee *employees;
@property (nullable, nonatomic, retain) Employee *manager;

@end

NS_ASSUME_NONNULL_END
