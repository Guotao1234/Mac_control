//
//  MyImageView.m
//  T1
//
//  Created by 郭韬 on 15/11/17.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
- (void) mouseDown:(NSEvent *)theEvent {
    
    [NSApp sendAction:[self action] to:[self target] from:self];
}

@end
