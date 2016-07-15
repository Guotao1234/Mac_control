//
//  AppDelegate.m
//  Test_NSAnimation
//
//  Created by 郭韬 on 15/11/19.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowController.h"
@interface AppDelegate ()<NSAnimationDelegate>
{
    NSViewAnimation *animation;
    MyWindowController *myWindowController;
}

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (IBAction)loginButton:(id)sender
{
    //登陆时的动画效果
    NSRect endFrame = self.window.frame;
    //开始时候window初始化位置
    endFrame.origin.y += NSHeight(endFrame);
    NSDictionary *animationInfo = @{
                                    //执行动画的目标对象
                                    NSViewAnimationTargetKey : self.window,
                                    //结束动画时的值
                                    NSViewAnimationEndFrameKey : [NSValue valueWithRect:endFrame],
                                    //对key执行动画的行为（逐渐消失的效果）
                                    NSViewAnimationEffectKey : NSViewAnimationFadeOutEffect
                                    };
    animation = [[NSViewAnimation alloc] initWithViewAnimations:@[animationInfo]];
    animation.delegate = self;
    animation.duration = 10;
    animation.animationBlockingMode = NSAnimationBlocking;
    [animation startAnimation];
    
}
#pragma mark - NSAnimation Delegate
- (void)animationDidEnd:(NSAnimation *)animation
{
    if (myWindowController == nil) {
        
        myWindowController = [[MyWindowController alloc] initWithWindowNibName:@"MyWindowController"];
    }
    [myWindowController.window makeKeyAndOrderFront:nil];
    NSLog(@"动画已经结束");
}
@end
