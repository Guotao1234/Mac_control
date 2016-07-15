//
//  AppDelegate.m
//  Test
//
//  Created by TanHao on 7/14/13.
//  Copyright (c) 2013 http://www.tanhao.me. All rights reserved.
//

#import "AppDelegate.h"
#import "NSImage+Stretchable.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSImage *image = [NSImage imageNamed:@"button"];
    [imageView1 setImage:image];
    
     NSImage *image2 = [image stretchableImageWithSize:NSMakeSize(100, 100) edgeInsets:NSEdgeInsetsMake(20, 15, 20, 15)];
    [imageView2 setImage:image2];
    
    NSImage *image3 = [image stretchableImageWithLeftCapWidth:25 middleWidth:100 rightCapWidth:25];
    [imageView3 setImage:image3];
}

@end
