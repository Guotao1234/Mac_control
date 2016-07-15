//
//  AppDelegate.m
//  Mac_Test_5
//
//  Created by 郭韬 on 15/10/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "DMSplitView.h"
@interface AppDelegate ()<DMSplitViewDelegate>

@property (nonatomic,weak) IBOutlet DMSplitView *splitView;
@property (nonatomic, weak) IBOutlet NSPanel *window;
@property (nonatomic,strong)NSWindow *myWindow;
@end

@implementation AppDelegate

@synthesize myWindow;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.splitView.subviewsResizeMode = DMSplitViewResizeModeUniform;
    NSLog(@"count = %ld",[self.splitView subviews].count);
    [self.splitView setPosition:100 ofDividerAtIndex:0];
    [self.splitView setMinSize:100 ofSubviewAtIndex:0];
    [self.splitView setMaxSize:150 ofSubviewAtIndex:0];
    
    // [self.splitView setPriority:2 ofSubviewAtIndex:0];
    // [self.splitView setCanCollapse:YES subviewAtIndex:0];
    
    //self.splitView.eventsDelegate = self;

    // Insert code here to initialize your application
    NSUInteger style = NSClosableWindowMask |NSFullScreenWindowMask| NSMiniaturizableWindowMask;
    NSRect frame = self.window.contentView.bounds;
    frame.origin.x += ((double)random()/LONG_MAX) * 200+100;
    frame.origin.y += ((double)random()/LONG_MAX) * 200+100;
    self.myWindow = [[NSWindow alloc] initWithContentRect:frame
                                                styleMask:style
                                                  backing:NSBackingStoreBuffered
                                                    defer:NO];
    
    [self.myWindow standardWindowButton:NSWindowMiniaturizeButton];
    [self.myWindow standardWindowButton:NSWindowZoomButton] ;
    [self.myWindow setTitle:@"新window"];
    [self.myWindow setOneShot:YES];
    self.myWindow.delegate = self;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)createWindowInCode:(id)sender {
    
    [self.myWindow makeKeyAndOrderFront:sender];
}
- (IBAction)closeWindow:(id)sender {
    //直接退出程序
    //[[NSApplication sharedApplication] terminate:nil];
    
    //[self.myWindow close];
    //[self.myWindow setOneShot:YES];
    if (self.myWindow != nil) {
        //窗口在关闭时候释放自己
        //[self.myWindow close];
        [self.myWindow setReleasedWhenClosed:YES];
        self.myWindow = nil;
        //[NSApp hide:self.myWindow];
        
    }
    
}
- (void)windowWillClose:(NSNotification *)notification{
    
 //   self.myWindow = nil;
    //[self.myWindow setReleasedWhenClosed:YES];
   [self.myWindow  orderOut:self];
    NSLog(@"myWindow将要被关闭 %@",self.myWindow);
    
}
- (void)windowDidMove:(NSNotification *)notification{
    
    NSLog(@"myWindow已经移除");
}
- (void)windowDidResignKey:(NSNotification *)notification{
    
    NSLog(@"已经释放了window");
}
- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag
{
    if (flag) {
        return NO;
    }
    else
    {
        [self.window makeKeyAndOrderFront:self];
        return YES;
    }
}
- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex
{
    NSLog(@"divi = %ld",dividerIndex);
    return 0;
}
- (CGFloat)splitView:(NSSplitView *)splitView constrainMaxCoordinate:(CGFloat)proposedMaximumPosition ofSubviewAt:(NSInteger)dividerIndex
{
    
    return 150;
}
@end

