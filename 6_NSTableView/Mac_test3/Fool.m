//
//  Fool.m
//  Mac_test3
//
//  Created by 郭韬 on 15/10/27.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "Fool.h"

@implementation Fool
/*
 想象一下在main函数中的NSApplicationMain 做了什么. 加载nib文件.
 遍历nib文件中的所有对象, 调用所以对象的awakeFromNib方法. event loop ...
 */
- (void)awakeFromNib{
    
    NSCalendar *now;
    
    now = [NSCalendar currentCalendar];
    NSLog(@"now = %@",now);
    [textField  setObjectValue:now];
}
@end
