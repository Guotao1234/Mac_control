//
//  AppDelegate.m
//  20_TableViewBinding
//
//  Created by 郭韬 on 15/11/6.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "MyWindowController.h"
NSString *KTableViewWindow = @"TableWindow";
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self showMyWindow];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
//关闭后再显示
- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag{
    
    if (flag) {
        //已经显示就不要重现打开
        return  NO;
    }
    else{
        
        [myWindowController.window makeKeyAndOrderFront:self];
        return YES;
    }
}
//显示window界面
- (void)showMyWindow{
    if (myWindowController == nil) {
        myWindowController = [[MyWindowController alloc] initWithWindowNibName:KTableViewWindow];
    }
    [myWindowController showWindow:self];
}
- (IBAction)OpenReadMe:(id)sender{
    
    //读取文本的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ReadMe" ofType:@"txt"];
    //NSWorkspace一般用于操作系统的文件，设备
    //打开文本
    [[NSWorkspace sharedWorkspace] openFile:path];
}
@end
