//
//  BigLetterView.m
//  15_NSPasteboard
//
//  Created by 郭韬 on 15/11/3.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "BigLetterView.h"

@implementation BigLetterView
//对拖拽对象执行的操作
- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender{
    
    return NSDragOperationEvery;
}
//允许执行的拖拽操作
- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender{
    
    NSPasteboard *pboard = [sender draggingPasteboard];
    NSArray *types = [pboard types];
    BOOL didDrop = NO;
    //如果类型包含富文本
    if ([types containsObject:NSRTFPboardType]) {
        
        didDrop = YES;
    }
    else if([types containsObject:NSStringPboardType]){
        //输出拖拽的字符串
       NSString *string = [pboard stringForType:NSStringPboardType];
        self.textStr = string;
        [self setNeedsDisplay:YES];
        NSLog(@"string = %@",string);
    }
    return YES;
}
//是否能够接受拖拽的数据
- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender{
    
       return YES;
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
     [_bgColor set];
     NSRect bounds = [self bounds];
    //设置默认的边线宽度
     [NSBezierPath setDefaultLineWidth:4.0];
    //设置填充的范围
    [NSBezierPath strokeRect:bounds];
    if (!self.textStr) {
        [[NSColor grayColor] set];
        [NSBezierPath fillRect:bounds];
    }else{
        NSAffineTransform* xform = [NSAffineTransform transform];
        //[xform translateXBy:0.0 yBy:-bounds.size.height];
        //[xform scaleXBy:1.0 yBy:-1.0];
        [xform concat];
        //文本段落的属性
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
        style.alignment = NSTextAlignmentLeft;
        style.lineBreakMode = NSLineBreakByCharWrapping;
        NSDictionary *dic = @{
                              NSFontAttributeName : [NSFont systemFontOfSize:19],
                              NSForegroundColorAttributeName : [NSColor blueColor],
                              NSParagraphStyleAttributeName  : style
                              };
        //计算字体的宽度和高度
        NSRect rect = [self.textStr boundingRectWithSize:NSMakeSize(bounds.size.width, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic];
        CGFloat width = bounds.size.width / 2.0;
        CGFloat height = bounds.size.height / 2.0;
        NSRect drwaRect = NSMakeRect(0, height,rect.size.width ,rect.size.height);
        [self.textStr drawInRect:drwaRect withAttributes:dic];
    }
    // Drawing code here.
}
- (void)setBgColor:(NSColor *)bgColor{
    _bgColor = bgColor;
    [self setNeedsDisplay:YES];
}
- (void)awakeFromNib{
    NSArray *array = [NSArray arrayWithObjects:NSRTFPboardType,NSStringPboardType, nil];
    //为这个视图注册一个剪切版类型
    [self registerForDraggedTypes:array];
    _bgColor = [NSColor greenColor];
}
- (void)writeToPastedboard:(NSPasteboard *)pd{
    //复制数据到剪切板
    [pd clearContents];
    [pd writeObjects:[NSArray arrayWithObject:_string]];
}
- (BOOL)readFromPastedboard:(NSPasteboard *)pd{
    NSArray *classes = [NSArray arrayWithObject:[NSString class]];
    NSArray *objects = [pd readObjectsForClasses:classes options:nil];
    
    if ([objects count] > 0) {
        
        //从剪切板中读取数据
        NSString *value = [objects objectAtIndex:0];
        //视图只能处理一个字节
        if ([value length] == 1) {
            [self setString:value];
            return YES;
        }
    }
    
    return NO;
}

- (IBAction)cut:(id)sender{
    [self copy:sender];
    [self setString:@"dds"];
}
- (IBAction)copy:(id)sender{
    NSPasteboard  *pb = [NSPasteboard generalPasteboard];
    [self writeToPastedboard:pb];
}
- (IBAction)paste:(id)sender{
    NSPasteboard *pb = [NSPasteboard generalPasteboard];
    if (![self readFromPastedboard:pb]) {
        NSBeep();
    }
}

@end
