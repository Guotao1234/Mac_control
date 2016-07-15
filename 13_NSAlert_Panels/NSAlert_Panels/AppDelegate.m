//
//  AppDelegate.m
//  NSAlert_Panels
//
//  Created by 郭韬 on 15/11/2.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "MyDocument.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    if (myDocument == nil) {
        myDocument = [[MyDocument alloc] init];
    }
    [myDocument makeWindowControllers];
    NSWindowController *windowController = [[myDocument windowControllers] lastObject];
    [windowController showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
