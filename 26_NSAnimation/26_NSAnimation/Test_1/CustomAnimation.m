//
//  CustomAnimation.m
//  Test_1
//
//  Created by 郭韬 on 15/11/18.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomAnimation.h"

@implementation CustomAnimation

//自定义动画类必须实现的方法，开始动画时，会自动调用当前的进程
- (void)setCurrentProgress:(NSAnimationProgress)currentProgress
{
    
    //必须调用super
    [super setCurrentProgress:currentProgress];
    //窗口从左向右平移
    NSLog(@"progress : %f",currentProgress);
    NSRect windRect = [[NSApp mainWindow] frame];
    NSRect screenRect = [[NSScreen mainScreen] visibleFrame];
    windRect.origin.x = currentProgress * (screenRect.size.width - windRect.size.width);
    [[NSApp mainWindow] setFrame:windRect display:YES];
}
@end
