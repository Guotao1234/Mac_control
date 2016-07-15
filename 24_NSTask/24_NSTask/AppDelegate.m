//
//  AppDelegate.m
//  24_NSTask
//
//  Created by 郭韬 on 15/11/16.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
//#define  DEBUG1
#ifndef  DEBUG1
    #define DebugLog(...) NSLog(__VA_ARGS__)
#else
    #define DebugLog(...) do{}while(0)
#endif

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    DebugLog(@"DebugLog的输出");
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (IBAction)startStopPing:(id)sender{
    
    //任务还在运行吗？
    if (task) {
        
        [task interrupt];
    }else{
        
        task = [[NSTask alloc] init];
        [task setLaunchPath:@"/sbin/ping"];
        NSArray *args = [NSArray arrayWithObjects:@"-c 10",[hostField stringValue], nil];
        [task setArguments:args];
        
        //创建一个新的pipe
        pipe = [[NSPipe alloc] init];
        [task setStandardOutput:pipe];
        
        NSFileHandle *fh = [pipe fileHandleForReading];
        NSNotificationCenter *nc;
        nc = [NSNotificationCenter  defaultCenter];
        [nc removeObserver:self];
        [nc addObserver:self selector:@selector(dataReady:) name:NSFileHandleReadCompletionNotification object:fh];
        [nc addObserver:self selector:@selector(taskTerminated:) name:NSTaskDidTerminateNotification object:task];
        [task launch];
        
        [outputView setString:@""];
        [fh readInBackgroundAndNotify];
    }
}
//如果任务已经执行了，数据已经准备好了，文件句柄就发出一条通知
- (void)appendData:(NSData *)d{
    
    NSString *s = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    NSTextStorage *ts = [outputView textStorage];
    NSLog(@"Length = %ld",[ts length]);
    //用String字符串去取代ts给定范围的字符串
    [ts replaceCharactersInRange:NSMakeRange([ts length], 0) withString:s];
    
}
- (void)dataReady:(NSNotification *)n{
    NSData *data;
    
    data = [[n userInfo] valueForKey:NSFileHandleNotificationDataItem];
    NSLog(@"dataReady:%ld bytes",[data length]);
    
    if ([data length]) {
        
        [self appendData:data];
    }
    //如果任务还在运行，再次读取数据
    if (task) {
        
        [[pipe fileHandleForReading] readInBackgroundAndNotify];
    }
    
}
- (void)taskTerminated:(NSNotification *)note{
    
    NSLog(@"taskTeriminate:");
    task = nil;
    [startButton setState:0];
}
// 打开网页
- (IBAction)openURL:(id)sender{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    [[NSWorkspace sharedWorkspace] openURL:url];
}
@end
