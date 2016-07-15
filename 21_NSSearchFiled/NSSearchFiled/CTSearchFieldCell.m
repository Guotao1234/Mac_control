//
//  CTSearchFieldCell.m
//  NSSearchFiled
//
//  Created by 郭韬 on 15/11/11.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CTSearchFieldCell.h"

@implementation CTSearchFieldCell

//通过代码实例化
- (id)init
{
    
    self = [super init];
    if (self)
    {
        
        [self setUp];
    }
    return self;
}
//通过xib实例化
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self setUp];
    }
    return self;
}
//重写设置搜索图标
- (void)setUp
{
    NSButtonCell *searchButtonCell = [self searchButtonCell];
    NSImage *searchImage = [NSImage imageNamed:@"search"];
    NSImage *alternateImage = [NSImage imageNamed:@"search-pushed"];
    //设置图片的大小
    [searchImage setSize:NSMakeSize(16, 16)];
    [alternateImage setSize:NSMakeSize(16, 16)];
    //设置普通状态的图标
    [searchButtonCell setImage:alternateImage];
    //设置选中的图标
    [searchButtonCell setAlternateImage:alternateImage];
}
//重写该方法实现对背景色的修改
//如果只是复写drawInteriorWithFrame，点击时候图片不会移动
- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
     //获取当前View的宽高
    NSRect rect = controlView.bounds;
   //设置绘画的路径
    NSBezierPath *bezierPath = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:(NSHeight(rect))/2 yRadius:(NSHeight(rect))/2];
    [[NSColor whiteColor] set];
    [bezierPath fill];
    [super drawInteriorWithFrame:cellFrame inView:controlView];
    
}
//重写该方法实现对光标颜色的修改
/*
- (NSText *)setUpFieldEditorAttributes:(NSText *)textObj{
    
    NSText *text = [super setUpFieldEditorAttributes:textObj];
    [(NSTextView *)text setInsertionPointColor:[NSColor blackColor]];
    return text;
}
*/
@end
