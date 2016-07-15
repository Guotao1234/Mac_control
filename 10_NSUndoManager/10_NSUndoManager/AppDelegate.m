//
//  AppDelegate.m
//  10_NSUndoManager
//
//  Created by 郭韬 on 15/10/29.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "Document.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    Document *doument = [[Document alloc] init];
    [doument makeWindowControllers];
    NSWindowController *windowCtr = [[doument windowControllers] lastObject];
    [windowCtr showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
