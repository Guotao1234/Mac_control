//
//  AppDelegate.m
//  McAnimation_CABaseAnimation_Extend
//
//  Created by TanHao on 12-12-15.
//  Copyright (c) 2012年 tanhao.me. All rights reserved.
//

#import "AppDelegate.h"
#import "THPanelView.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(progressChanged:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)progressChanged:(id)sender
{
    float progress = (arc4random()*1.0)/0xFFFFFFFF;
    [panelView setProgress:progress];
}

@end
