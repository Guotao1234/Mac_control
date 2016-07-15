//
//  DepartmentViewController.m
//  18_NSViewController
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "DepartmentViewController.h"

@interface DepartmentViewController ()

@end

@implementation DepartmentViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"Departments"];
    }
    return self;
}
- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        [self setTitle:@"Departments"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
