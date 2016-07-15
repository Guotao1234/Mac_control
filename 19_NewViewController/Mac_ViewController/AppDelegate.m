//
//  AppDelegate.m
//  Mac_ViewController
//
//  Created by 郭韬 on 15/11/5.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowController.h"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
   // [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"NSConstraintBasedLayoutVisualizeMutuallyExclusiveConstraints"];
    // Insert code here to initialize your application
    if (myWindowController == nil) {
        
        myWindowController = [[MyWindowController alloc] initWithWindowNibName:@"TestWindow"];
    }
    [myWindowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
//关闭再打开时window时所设置的方法，注意连接File owner的window
- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag{
    
    if (flag) {
        return NO;
    }
    else {
        NSLog(@"myWindow = %@",myWindowController.window);
        [myWindowController.window makeKeyAndOrderFront:self];
        return YES;
    }
}
@end
