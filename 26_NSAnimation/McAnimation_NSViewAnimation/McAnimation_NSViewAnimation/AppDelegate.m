//
//  AppDelegate.m
//  McAnimation_NSViewAnimation
//
//  Created by Hao Tan on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
}

- (IBAction)startAnimation:(id)sender;
{    
    id animationTarget = nil;
    //选装按钮的Column
    if (matrix.selectedColumn == 0)
    {
        animationTarget = animationView;
    }else 
    {
        animationTarget = self.window;
    }
    
    NSRect startFrame = [animationTarget frame];
    NSRect endFrame = NSMakeRect(0, 0, startFrame.size.width, startFrame.size.height);
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                animationTarget,NSViewAnimationTargetKey,
                                NSViewAnimationFadeInEffect,NSViewAnimationEffectKey,
                                [NSValue valueWithRect:startFrame],NSViewAnimationStartFrameKey,
                                [NSValue valueWithRect:endFrame],NSViewAnimationEndFrameKey, nil];
    NSViewAnimation *animation = [[NSViewAnimation alloc] initWithViewAnimations:[NSArray arrayWithObject:dictionary]];
    animation.delegate = self;
    animation.duration = 2;
    //NSAnimationBlocking阻塞
    //NSAnimationNonblocking异步不阻塞
    //NSAnimationNonblockingThreaded线程不阻塞
    [animation setAnimationBlockingMode:NSAnimationNonblockingThreaded];
    [animation startAnimation];
}

- (void)animationDidEnd:(NSAnimation*)animation
{
    //判断是否在主线程上执行的
    NSLog(@"%d",[[NSThread currentThread] isMainThread]);
    NSLog(@"The animation did end !");
}

@end
