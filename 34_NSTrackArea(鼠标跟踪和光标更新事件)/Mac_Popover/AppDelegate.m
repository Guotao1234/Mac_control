//
//  AppDelegate.m
//  Mac_Popover
//
//  Created by 郭韬 on 15/11/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowController.h"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    if (_myWindowController == nil) {
        
        _myWindowController = [[MyWindowController alloc] initWithWindowNibName:@"MyWindowController"];
    }
    [_myWindowController showWindow:nil];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    if (flag)
    {
        return NO;
    }
    else
    {
        [_myWindowController.window  makeKeyAndOrderFront:self];
        return YES;
    }
}
//当窗口关闭时候退出
/*
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    
    return YES;
}
*/
@end
