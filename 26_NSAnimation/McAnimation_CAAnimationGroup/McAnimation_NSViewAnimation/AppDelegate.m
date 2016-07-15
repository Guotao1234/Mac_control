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
    //透明度
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.duration = 2.0;
    animation.autoreverses = YES;
    animation.repeatCount = NSIntegerMax;
    animation.fromValue = [NSNumber numberWithFloat:1];
    animation.toValue = [NSNumber numberWithFloat:0];
    
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation1.duration = 2.0;
    animation1.autoreverses = YES;
    animation1.repeatCount = NSIntegerMax;
    animation1.fromValue = [NSNumber numberWithFloat:0];
    animation1.toValue = [NSNumber numberWithFloat:2*pi];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 2.0;
    group.autoreverses = YES;
    group.repeatCount = NSIntegerMax;
    group.animations = [NSArray arrayWithObjects:animation,animation1, nil];
    [animationView.layer addAnimation:group forKey:@""];
}

@end
