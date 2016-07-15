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
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//    animation.duration = 2.0;
//    animation.autoreverses = YES;
//    animation.repeatCount = NSIntegerMax;
//    animation.fromValue = [NSNumber numberWithFloat:1];
//    animation.toValue = [NSNumber numberWithFloat:0];
//    [animationView.layer addAnimation:animation forKey:@""];
    
      //缩放1    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    animation.duration = 2.0;
//    animation.autoreverses = YES;
//    animation.repeatCount = NSIntegerMax;
//    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 0.1)];
//    [animationView.layer addAnimation:animation forKey:@""];
    
    //缩放2
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation.duration = 2.0;
//    animation.autoreverses = YES;
//    animation.repeatCount = NSIntegerMax;
//    animation.fromValue = [NSNumber numberWithFloat:1.0];
//    animation.toValue = [NSNumber numberWithFloat:0.1];
//    [animationView.layer addAnimation:animation forKey:@""];
    
    //旋转1
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    animation.duration = 2.0;
//    //animation.autoreverses = YES;
//    animation.repeatCount = NSIntegerMax;
//    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
//    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(CATransform3DIdentity, pi, 0, 0, 1)];
//    [animationView.layer addAnimation:animation forKey:@""];
    
    //旋转2
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
//    animation.duration = 2.0;
//    //animation.autoreverses = YES;
//    animation.repeatCount = NSIntegerMax;
//    animation.fromValue = [NSNumber numberWithFloat:0];
//    animation.toValue = [NSNumber numberWithFloat:2*pi];
//    [animationView.layer addAnimation:animation forKey:@""];


    //平移1
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.duration = 2.0;
    animation.autoreverses = YES;
    animation.repeatCount = NSIntegerMax;
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DTranslate(CATransform3DIdentity, 100, 100, 0)];
    [animationView.layer addAnimation:animation forKey:@""];
    
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        //平移2
        [animationView.layer removeAllAnimations];
    });
    
    
}

@end
