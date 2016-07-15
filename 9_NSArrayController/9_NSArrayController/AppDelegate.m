//
//  AppDelegate.m
//  9_NSArrayController
//
//  Created by 郭韬 on 15/10/28.
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
    MyDocument  *myDocu = [[MyDocument alloc] init];
    //通过windowNibName的return返回以一个windowNibName创建初始化windowController
    [myDocu makeWindowControllers];
    //The document’s current window controllers.
    NSArray *array =  myDocu.windowControllers;
    NSWindowController *myWindowCtr = array[0];
    //显示当前的window
    [myWindowCtr showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
