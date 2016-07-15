//
//  CustomView.m
//  17_NSFormatter
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
//从xib文件加载时初始化
- (void)awakeFromNib{
    _bgColor = [NSColor greenColor];
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect rect = [self bounds];
    //设置背景颜色
    [_bgColor set];
    [NSBezierPath setDefaultLineWidth:4];
    [NSBezierPath fillRect:rect];
   // [[NSNotificationCenter defaultCenter] postNotificationName:@"bgColor" object:self userInfo:nil];
    // Drawing code here.
}
- (IBAction)changeBackgroundColor:(id)sender{
    [self setBgColor:colorWell.color];
   // NSLog(@"color = %@",self.bgColor);
}
@end
