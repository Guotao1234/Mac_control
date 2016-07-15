//
//  AppDelegate.h
//  Test
//
//  Created by TanHao on 7/14/13.
//  Copyright (c) 2013 http://www.tanhao.me. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet NSImageView *imageView1;
    IBOutlet NSImageView *imageView2;
    IBOutlet NSImageView *imageView3;
}

@property (assign) IBOutlet NSWindow *window;

@end
