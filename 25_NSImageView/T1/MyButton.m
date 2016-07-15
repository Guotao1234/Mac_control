//
//  MyButton.m
//  T1
//
//  Created by 郭韬 on 15/11/17.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyButton.h"
@interface MyButtonCell:NSButtonCell

@property (assign) CGFloat cornerRadius;
@property (strong) NSColor *background;
@property (strong) NSColor *highlightColor;
@property (strong) NSColor *textColor;
@property (strong) NSColor *highlightTextColor;
@property (assign) NSEdgeInsets padding;
@end

@interface MyButton ()

@property (strong)MyButtonCell *buttonCell;

@end

@implementation MyButton
@dynamic buttonCell;
@dynamic cornerRadius, padding,backgroundColor, highlightColor, textColor, highlightTextColor;
- (instancetype)initWithFrame:(NSRect)frameRect{
    
    self = [super initWithFrame:frameRect];
    if (self) {
        
        self.cornerRadius = 4;
        self.backgroundColor = [NSColor colorWithWhite:0.0 alpha:0.3];
        self.highlightColor = [NSColor colorWithWhite:0.0 alpha:0.3];
        self.textColor = [NSColor colorWithWhite:0.2 alpha:0.9];
        self.highlightTextColor = [NSColor colorWithWhite:0.2 alpha:0.5];
        self.padding = NSEdgeInsetsMake(2, 13, 2, 13);
        
        self.font = [NSFont systemFontOfSize:13];
        self.subpixelAntialiasing = YES;
        
        self.wantsLayer = YES;

    }
    return self;
}

- (id)initWithHighlightColor:(NSColor *)highlightColor{
    
    self = [self initWithFrame:NSMakeRect(0, 0, 0, 0)];
    
    if (self){
        self.highlightColor = highlightColor;
        self.highlightTextColor = highlightColor;
    }
    
    return self;
}
- (void)awakeFromNib{
    
    self.cornerRadius = 4;
    self.backgroundColor = [NSColor colorWithWhite:0.0 alpha:0.3];
    self.highlightColor = [NSColor colorWithWhite:0.0 alpha:0.3];
    self.textColor = [NSColor colorWithWhite:0.2 alpha:0.9];
    self.highlightTextColor = [NSColor colorWithWhite:0.2 alpha:0.5];
    self.padding = NSEdgeInsetsMake(2, 13, 2, 13);
    
    self.font = [NSFont systemFontOfSize:13];
    self.subpixelAntialiasing = YES;
    
    self.wantsLayer = YES;

}
- (void)drawRect:(NSRect)dirtyRect {
    
    
    // Drawing code here.
    //取得绘制的上下文
    CGContextRef context = [[NSGraphicsContext currentContext] CGContext];
    //保存当前上下文
    CGContextSaveGState(context);
    
    //设置字体的初始化
    CGContextSetShouldSmoothFonts(context, self.subpixelAntialiasing);
    CGContextSetShouldSubpixelPositionFonts(context, self.subpixelAntialiasing);
    CGContextSetShouldSubpixelQuantizeFonts(context, self.subpixelAntialiasing);
    
    //画Button
    [super drawRect:dirtyRect];
    //设置当前的状态
    CGContextRestoreGState(context);
}
+ (Class)cellClass{
    
    return [MyButtonCell class];
}

#pragma mark cell 
- (CGFloat)cornerRadius{
    
    return self.buttonCell.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    
    self.buttonCell.cornerRadius = cornerRadius;
}
- (NSColor *)backgroundColor{
    
    return  self.buttonCell.background;
}
- (void)setBackgroundColor:(NSColor *)backgroundColor{
    
    self.buttonCell.background = backgroundColor;
    self.buttonCell.backgroundColor = backgroundColor;
}
- (NSColor *)highlightColor{
    
    return self.buttonCell.highlightColor;
}
- (void)setHighlightColor:(NSColor *)highlightColor{
    
    self.buttonCell.highlightColor = highlightColor;
}
- (NSColor *)textColor{
    
    return self.buttonCell.textColor;
}
- (void)setTextColor:(NSColor *)textColor{
    
    self.buttonCell.textColor = textColor;
}
- (NSColor *)highlightTextColor{
    
    return self.buttonCell.highlightTextColor;
}
- (void)setHighlightTextColor:(NSColor *)highlightTextColor{
    
    self.buttonCell.highlightTextColor = highlightTextColor;
}
- (NSEdgeInsets)padding{
    
    return self.buttonCell.padding;
}
@end

@implementation MyButtonCell

- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView{
    
    [super drawInteriorWithFrame:cellFrame inView:controlView];
    //高亮状态
    if (self.highlighted) {
        
        NSGraphicsContext *context = [NSGraphicsContext currentContext];
        NSRect result;
        [context saveGraphicsState];
        {
            
            //Highlight BG
            [[NSBezierPath bezierPathWithRoundedRect:cellFrame
                                             xRadius:self.cornerRadius
                                             yRadius:self.cornerRadius] setClip];
            
            [self.highlightColor setFill];
            NSRectFillUsingOperation(cellFrame, NSCompositeSourceOver);
            
            //Draw title text over it
            NSMutableAttributedString *attrString = [self.attributedTitle mutableCopy];
            [attrString beginEditing];
            [attrString addAttribute:NSForegroundColorAttributeName value:self.highlightTextColor range:NSMakeRange(0, [attrString length])];
            [attrString endEditing];
            result = [super drawTitle:attrString withFrame:cellFrame inView:controlView];

        }
        [context restoreGraphicsState];
        
    }
}
- (void)drawBezelWithFrame:(NSRect)frame inView:(NSView *)controlView
{
    NSGraphicsContext* ctx = [NSGraphicsContext currentContext];
    
    [ctx saveGraphicsState];
    {
        [[NSBezierPath bezierPathWithRoundedRect:frame
                                         xRadius:self.cornerRadius
                                         yRadius:self.cornerRadius] setClip];
        
        [self.background setFill];
        NSRectFillUsingOperation(frame, NSCompositeSourceOver);
    }
    [ctx restoreGraphicsState];
}
- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView
{
    NSGraphicsContext* ctx = [NSGraphicsContext currentContext];
    NSRect result;
    [ctx saveGraphicsState];
    {
        
        if (self.textColor && !self.highlighted) {
            NSMutableAttributedString *attrString = [title mutableCopy];
            
            [attrString beginEditing];
            [attrString addAttribute:NSForegroundColorAttributeName value:self.textColor range:NSMakeRange(0, [attrString length])];
            [attrString endEditing];
            
            title = attrString;
            
            result = [super drawTitle:title withFrame:frame inView:controlView];
        }
        
    }
    [ctx restoreGraphicsState];
    
    return result;
}
- (NSRect)titleRectForBounds:(NSRect)theRect
{
    NSEdgeInsets padding = self.padding;
    
    theRect.origin.x += padding.left;
    theRect.origin.y += padding.top;
    theRect.size.width -= (padding.left + padding.right);
    theRect.size.height -= (padding.top + padding.bottom);
    
    return theRect;
}
- (NSSize)cellSize
{
    return [super cellSize];
}

- (NSSize)cellSizeForBounds:(NSRect)aRect
{
    NSSize result = [super cellSizeForBounds:aRect];
    NSEdgeInsets padding = self.padding;
    
    result.width += padding.left + padding.right;
    result.height += padding.top + padding.bottom;
    
    return result;
}
@end
