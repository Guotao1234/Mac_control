//
//  WindowView.m
//  T1
//
//  Created by 郭韬 on 16/3/17.
//  Copyright © 2016年 33e9. All rights reserved.
//

#import "WindowView.h"

@implementation WindowView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    NSBezierPath* border = [NSBezierPath bezierPathWithRect:self.frame];
    [border setLineWidth: 1.0];
    [[NSColor windowFrameColor] set];
    [border stroke];
}

@end
