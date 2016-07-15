//
//  MyView.m
//  Mac_test_4
//
//  Created by 郭韬 on 15/10/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    //[self displayIfNeeded];
    //NSButtonCell *cell = [[NSButtonCell alloc] init];
    //NSRect rect = NSMakeRect(0, 0, 200, 200);
    //NSButton *button = [[NSButton alloc] initWithFrame:rect];
    //[button setCell:cell];
    NSButton *registerBtn = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 55, 24)];
    // [registerBtn setTransparent:YES];
    [registerBtn setButtonType:NSMomentaryPushInButton];
    [registerBtn setEnabled:YES];
    [registerBtn setTarget:self];
    [registerBtn setAction:@selector(showRegisterVC)];
    [self addSubview:registerBtn];
}
- (void)showRegisterVC
{
    NSLog(@"-----------------");
}
- (void)mouseDown:(NSEvent *)theEvent
{
    NSLog(@"011112321333");
}
@end

