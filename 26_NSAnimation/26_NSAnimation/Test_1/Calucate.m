//
//  Calucate.m
//  Test_1
//
//  Created by 郭韬 on 15/11/18.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "Calucate.h"
#import "CustomAnimation.h"
#import <QuartzCore/QuartzCore.h>
@implementation Calucate
static int i;
- (instancetype)init{
    
    self = [super init];
    if (self) {
        
        [_textField setStringValue:@"ddddddd0"];
    }
    return self;
}
//添加awakeFromNib来初始化文本框的值
- (void)awakeFromNib{
    
    rect = _imageView.frame;
     [_textField setStringValue:@"0"];
}
- (IBAction)addAction:(id)sender{
    
    //[self setAnimation];
    [self custonAnimation];
    [_textField setStringValue:[NSString stringWithFormat:@"%d",i]];
}
- (IBAction)deleteAction:(id)sender{
    
    [_textField setStringValue:[NSString stringWithFormat:@"%d",--i]];
    CustomAnimation *animation = [[CustomAnimation alloc] initWithDuration:5 animationCurve:NSAnimationEaseIn];
    [animation setAnimationBlockingMode:NSAnimationNonblocking];
    [animation startAnimation];
    
    //[self setAnimationClicked];
   // [NSApp terminate:self];
}
//自定义动画
- (void)custonAnimation
{
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext]setDuration:1.0f];
   // [[_imageView animator] setAlphaValue:0];
    //[[_imageView animator] setFrameOrigin:NSMakePoint(0, 0)];
   // [[_imageView animator].layer setTransform:CATransform3DMakeScale (2,2,2)];
    
   //[[_imageView animator] setHidden:YES];
    rect.origin.y = rect.origin.y - 100;
    [[_imageView animator] setFrame:rect];
    [NSAnimationContext  endGrouping];
    
}
//设置图片逐渐消失的动画
- (void)setAnimation
{
    NSDictionary *fadeIn = [NSDictionary dictionaryWithObjectsAndKeys:_imageView,NSViewAnimationTargetKey,NSViewAnimationFadeInEffect,NSViewAnimationEffectKey, nil];
    NSViewAnimation *animation = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObjects:fadeIn, nil]];
    [animation setAnimationBlockingMode:NSAnimationBlocking];
    [animation setDuration:5];
    [animation setAnimationCurve:NSAnimationEaseIn];
    [animation startAnimation];
}
- (void)setAnimationClicked
{
    //创建时长为5s的动画并设置时间曲线
    NSAnimation *animation = [[NSAnimation alloc] initWithDuration:5 animationCurve:NSAnimationEaseIn];
    //设置代理
    [animation setDelegate:self];
    //设置关键点(0-1)设置动画执行时候的标志,progress mark可以设置多个触发点N
    [animation setProgressMarks:@[@0.1,@0.2,@0.3,@0.4,@0.5,@1]];
    //设置阻塞模式，默认是阻塞
    //动画执行模式为阻塞执行，需要等待动画执行完才会返回
    [animation setAnimationBlockingMode:NSAnimationNonblocking];
    //开始执行动画
    [animation startAnimation];
}
//通过代理来获取时间点进行操作
- (void)animationDidEnd:(NSAnimation *)animation
{
    NSLog(@"animation ended!");
}
- (void)animationDidStop:(NSAnimation *)animation
{
    NSLog(@"animation stopped");
}
//关键点代理方法
- (void)animation:(NSAnimation *)animation didReachProgressMark:(NSAnimationProgress)progress
{
    NSLog(@"progress : %f",progress);
    NSRect windRect = [[NSApp mainWindow] frame];
    NSRect screenRect = [[NSScreen mainScreen] visibleFrame];
    windRect.origin.x = progress * (screenRect.size.width - windRect.size.width);
    [[NSApp mainWindow] setFrame:windRect display:YES];
}
@end
