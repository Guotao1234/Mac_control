//
//  AppDelegate.m
//  McAnimation_NSViewAnimation
//
//  Created by Hao Tan on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self.window.contentView setWantsLayer:YES];
    [animationView.layer setAnchorPoint:NSMakePoint(0.5, 0.5)];
}

- (IBAction)startAnimation:(id)sender;
{    
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.duration = 2;
    keyframeAnimation.repeatCount = NSIntegerMax;
    //CGAffineTransformIdentity默认状态
    //缩放的是中心的位置
    CGAffineTransform transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
    //创建一个可变的绘图路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置中心点的位置
    NSPoint center = NSMakePoint([self.window.contentView frame].size.width/2, [self.window.contentView frame].size.height/2);
    /*
     path               可变的路径
     m                  根据缩放的点来确定路径
     x                  center.x     中心点X的位置
     y                  center.y    中心点Y的位置
     r                  70     为半径
     startAngle 0       开始时候的角度
     endAngle           2*pi   结束时候的角度
     clockwise           NO     是逆时针旋转  YES    是顺时针旋转
     */
    CGPathAddArc(path, &transform, center.x, center.y, 70, 0, 2*pi, YES);
    keyframeAnimation.path = path;
    CGPathRelease(path);
    [animationView.layer addAnimation:keyframeAnimation forKey:@""];
}

@end
