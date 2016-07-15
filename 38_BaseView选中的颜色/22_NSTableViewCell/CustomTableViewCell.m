//
//  CustomTableViewCell.m
//  22_NSTableViewCell
//
//  Created by 郭韬 on 15/11/26.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib
{
    
    NSLog(@"从xib文件唤醒");
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    //设置背景颜色
    NSRect rect = NSMakeRect(0, 0, self.bounds.size.width + 15, self.bounds.size.height+ 20);
    NSBezierPath *path = [NSBezierPath bezierPathWithRect:rect];
    [[NSColor clearColor] set];
    [path fill];
    // Drawing code here.
}
@end
