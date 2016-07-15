//
//  AppDelegate.m
//  29_SystemStates
//
//  Created by 郭韬 on 15/11/19.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"

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
//获取OSX系统状态的切换信息
- (void)getSystemInfo
{
    
    [[[NSWorkspace sharedWorkspace] notificationCenter]addObserver:self selector:@selector(sleepMethod:) name:NSWorkspaceWillSleepNotification object:nil];
    /*
     
     NSWorkspaceWillSleepNotification睡眠
     
     NSWorkspaceDidWakeNotification从睡眠中唤醒
     
     NSWorkspaceWillPowerOffNotification当用户注销或关机
     
     NSWorkspaceSessionDidResignActiveNotification被切换到另一用户
     
     NSWorkspaceSessionDidBecomeActiveNotification被切换回到当前用户
     
     NSWorkspaceScreensDidSleepNotification屏幕睡眠
     
     NSWorkspaceScreensDidWakeNotification屏幕唤醒
     */
    
    
    //对于某一些系统状态就需要一下的NSDistributedNotificationCenter(跨进程的通知)
    
    /*
     [[NSDistributedNotificationCenter defaultCenter] addObserver:self
     
     selector:@selector(screensaverStart:)
     
     name:@"com.apple.screensaver.didstart"
     
     object:nil];
     
     //其中的通知名称可以是：
     
     com.apple.screensaver.didstart屏保开始
     
     com.apple.screensaver.willstop屏保将要结束
     
     com.apple.screensaver.didstop屏保结束
     
     com.apple.screenIsLocked屏幕锁住
     
     com.apple.screenIsUnlocked屏幕解锁
     */
}
@end
