//
//  BigLetterView.m
//  16_NSTimer
//
//  Created by 郭韬 on 15/11/3.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSRect bounds = [self bounds];
    [_bgColor set];
    [NSBezierPath fillRect:bounds];
    //绘制字体到视图中间
    [self drawStringCenteredIn:bounds];
    //当前是否为窗口的frist responder
    if ([[self window] firstResponder] == self && [NSGraphicsContext currentContextDrawingToScreen]) {
        [NSGraphicsContext saveGraphicsState];
        NSSetFocusRingStyle(NSFocusRingOnly);
        // [[NSColor keyboardFocusIndicatorColor] set];
        [NSBezierPath setDefaultLineWidth:4.0];
        //用当前填充颜色填充指定的矩形路径。
        [NSBezierPath fillRect:bounds];
        //使用当前的笔画颜色和默认的绘图属性来绘制指定矩形的路径
        //   [NSBezierPath strokeRect:bounds];
        [NSGraphicsContext restoreGraphicsState];
    }
    // Drawing code here.
}
//创建在矩形中间显示字符串的方法
- (void)drawStringCenteredIn:(NSRect)rect{
    NSSize strSize = [_string sizeWithAttributes:_attributes];
    NSPoint strOrigin;
    strOrigin.x  = rect.origin.x + (rect.size.width - strSize.width)/2;
    strOrigin.y = rect.origin.y + (rect.size.height - strSize.height)/2;
    [_string drawAtPoint:strOrigin withAttributes:_attributes];
}
- (void)awakeFromNib{
    
    [self prepareAttributes];
    _bgColor = [NSColor blueColor];
    _string = @"ds";
}
#pragma mark - 设置字体的属性
- (void)prepareAttributes{
    _attributes = [NSMutableDictionary dictionary];
    [_attributes setObject:[NSFont userFontOfSize:75] forKey:NSFontAttributeName];
    [_attributes setObject:[NSColor redColor] forKey:NSForegroundColorAttributeName];
    
}
@end
