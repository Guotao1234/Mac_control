//
//  CustomView.m
//  T1
//
//  Created by 郭韬 on 16/3/17.
//  Copyright © 2016年 33e9. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    
    NSRect bounds = [self bounds];
    //NSColor *color = [NSColor colorWithCalibratedRed:23/255.0 green:156/255.0 blue:206/255.0 alpha:1.0];
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];
    // Drawing code here.
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
    self.block(true);
    [MyWindowController shareInsdtance];
}
@end
