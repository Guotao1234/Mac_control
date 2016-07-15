//
//  AppDelegate.m
//  T1
//
//  Created by 郭韬 on 15/11/16.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowController.h"
@interface AppDelegate (){
    
    MyWindowController  *myWindowCtr;
}

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [MyWindowController shareInsdtance];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag{
    
    if (flag) {
        
        return NO;
    }else{
        
        [myWindowCtr.window makeKeyAndOrderFront:self];
        
        return YES;
    }
}
@end
