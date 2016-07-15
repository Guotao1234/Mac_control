//
//  PersonWindowController.m
//  T1
//
//  Created by 郭韬 on 15/11/17.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "PersonWindowController.h"

@interface PersonWindowController ()

@end

@implementation PersonWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    //设置窗口title栏不可移动
   // [self.window setMovable:NO];
    
    NSButton *aButton = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 120, 120)];
    [aButton setButtonType: NSMomentaryPushInButton];
    [aButton setAutoresizingMask: NSViewMaxXMargin | NSViewMinYMargin];
    [aButton setTitle: @"Close"];
    [aButton setImage:[NSImage imageNamed:@"1"]];
    [aButton setTarget: self];
    [aButton setAction: @selector(customClose:)];
    [self.window.contentView addSubview:aButton];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (void)customClose:(id)sender{
    
    NSLog(@"fghjkl;");
}
@end
