//
//  AppDelegate.m
//  12_NibAndNSWindowController
//
//  Created by 郭韬 on 15/10/30.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResize:) name:NSWindowDidResizeNotification object:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (void)windowDidResize:(NSNotification *)notification{
    
    NSLog(@"屏幕的尺寸的大小正在发生改变");
}
@end
