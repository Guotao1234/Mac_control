//
//  AppController.m
//  17_NSFormatter
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppController.h"
#import "CustomView.h"
@implementation AppController
- (void)dealloc{
    
    [customView removeObserver:self forKeyPath:@"bgColor"];
}
- (instancetype)init{
    
    self = [super init];
    if (self) {
        //设置KVO模式
        [customView addObserver:self
                     forKeyPath:@"bgColor"
                        options:NSKeyValueObservingOptionNew
                        context:nil];
    }
    return self;
}
//属性值发生变化会调用下方方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSLog(@"chang = %@",change);
}
@end
