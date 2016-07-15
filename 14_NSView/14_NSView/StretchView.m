//
//  StretchView.m
//  14_NSView
//
//  Created by 郭韬 on 15/11/2.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "StretchView.h"

@implementation StretchView
//当一个View需要刷新显示时，它将会受到drawRect:的消息，参数为一个需要重画的矩形区域，这个方法会被自动调用，如果需要重新让一个View重画，可以调用方法setNeedsDisplays；
- (void)drawRect:(NSRect)dirtyRect {
   // [super drawRect:dirtyRect];
    
//    NSRect bounds = [self bounds];
//    [[NSColor greenColor] set];
//    //使用NSBezierPath绘制图案，给View上色
//    [NSBezierPath fillRect:bounds];
    // Drawing code here.
    NSRect bounds = [self bounds];
    [[NSColor greenColor] set];
    [NSBezierPath fillRect:bounds];
    [[NSColor whiteColor] set];
    [path fill];
    if (image) {
        
        NSRect imageRect;
        imageRect.origin = NSZeroPoint;
        imageRect.size = [image size];
        NSRect drawingRect = imageRect;
        [image drawInRect:drawingRect
                 fromRect:imageRect
                operation:NSCompositeSourceOver
                 fraction:_opacity];
    }
}
//从xib文件唤醒
- (void)awakeFromNib{
    path = [[NSBezierPath alloc] init];
    [path setLineWidth:3.0];
    NSPoint p = [self randomPoint];
    [path moveToPoint:p];
    int i;
    for (i = 0; i < 15; i++) {
        p = [self randomPoint];
        [path lineToPoint:p];
    }
    [path closePath];
}
- (instancetype)initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame:frameRect];
    if (self) {
        path = [[NSBezierPath alloc] init];
        [path setLineWidth:3.0];
        NSPoint p = [self randomPoint];
        [path moveToPoint:p];
        int i;
        for (i = 0; i < 15; i++) {
            p = [self randomPoint];
            [path lineToPoint:p];
        }
        [path closePath];
    }
    return self;
}
- (NSPoint)randomPoint{
    
    NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % (int)r.size.height;
    return result;
}
- (void)setImage:(NSImage *)newImage{
    
    image = newImage;
    [self setNeedsDisplay:YES];
}
- (float)opacity{
    return _opacity;
}
- (void)setOpacity:(float)opacity{
    self.opacity = opacity;
    [self setNeedsDisplay:YES];
}
@end
