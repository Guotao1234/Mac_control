//
//  AppDelegate.m
//  Test4
//
//  Created by 郭韬 on 15/10/28.
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
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (IBAction)addNewWindow:(id)sender{
    
    if (myWindowController == nil) {
        
        myWindowController = [[MyWindowController alloc]init];
    }
    NSWindow *window1 = [self window];
    [myWindowController showModelFromWindow:window1];
    
}
- (IBAction)cancelAction:(id)sender{
    
}
@end
