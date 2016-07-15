//
//  AppDelegate.m
//  Mac_test_4
//
//  Created by 郭韬 on 15/10/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomButton.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
    //[button sendAction:@selector(buttonAction:) to:self];
    [button setAction:@selector(buttonAction:)];
    [button setTarget:self];
    [button setTitle:@"按钮"];
   // [self.window.contentView addSubview:button];
    NSURL *url = [NSURL URLWithString:@"http://img4.douban.com/img/celebrity/large/21559.jpg"];
    NSData *data1 = [NSData dataWithContentsOfURL:url];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
//增加按钮的点击行为
- (void)buttonAction:(NSButton *)button{
    
    NSLog(@"输出数据");
}

@end
