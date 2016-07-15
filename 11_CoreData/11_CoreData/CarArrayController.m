//
//  CarArrayController.m
//  11_CoreData
//
//  Created by 郭韬 on 15/10/29.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CarArrayController.h"

@implementation CarArrayController

- (instancetype)newObject{
    
    id newObj = [super newObject];
    NSDate *now = [NSDate date];
    NSLog(@"time now = %@",now);
    [newObj setValue:now forKey:@"datePurchased"];
    return newObj;
}
@end
