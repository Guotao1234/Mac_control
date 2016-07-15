//
//  AppController.m
//  12_NibAndNSWindowController
//
//  Created by 郭韬 on 15/10/30.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"
#import "MyDocument.h"
@implementation AppController
- (IBAction)showPreferencePanel:(id)sender{
    //懒加载模式，只会创建一次preferenceController
    if (!preferenceController) {
        preferenceController = [[PreferenceController alloc] initWithWindowNibName:@"PreferenceController"];
    }
    [preferenceController showWindow:self];
}
//在接受其他消息前,每个类首先都会接受的initialize 消息. 我们重载 Appcontroller的initialize方法,来分别先register defaults
//意思是在接受showPreferencePanel这个按钮之前会初始化NSUserDefaults
+ (void)initialize{
    //如果对象时NSString.NSDictionary.NSArray.NSData.NSNumber  可以直接使用NSKeyedArchiver进行对象归档和恢复
    NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:[NSColor yellowColor]];
    [defaultValues setObject:colorAsData forKey:BNRTableBgColorKey];
    [defaultValues setObject:[NSNumber numberWithBool:YES] forKey:BNREmptyDocKey];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
   // NSLog(@"registered defaults:%@",defaultValues);
}
#pragma mark - applicationDelegate
- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender{
    
    NSLog(@"applicationShouldOpenOpenUntitledFile");
      [[NSUserDefaults standardUserDefaults] boolForKey:BNREmptyDocKey];
    return NO;
}
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    myDocument = [[MyDocument alloc] init];
    [myDocument makeWindowControllers];
    NSWindowController *windowCtr = [[myDocument windowControllers] lastObject];
    
    // Insert code here to initialize your application
    //接受系统屏幕正在改变的系统通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(windowDidResize:) name:NSWindowDidResizeNotification object:nil];
    [windowCtr showWindow:self];
}
//发送系统的通知
- (void)windowDidResize:(NSNotification *)notification{
    
    NSLog(@"屏幕的尺寸的大小正在发生改变");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
@end
