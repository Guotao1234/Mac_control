//
//  CustomTableViewController.m
//  Mac_ViewController
//
//  Created by 郭韬 on 15/11/5.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomTableViewController.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController

- (void)awakeFromNib{
    
    //初始化数组控制器
    [tableArray addObjects: [NSArray arrayWithObjects:
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Keith", @"name",
                                nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Craig", @"name",
                                nil],
                               [NSDictionary dictionaryWithObjectsAndKeys:
                                @"Eric", @"name",
                                nil],
                               nil]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
