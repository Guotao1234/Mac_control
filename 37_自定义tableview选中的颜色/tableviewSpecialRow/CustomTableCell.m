//
//  CustomTableCell.m
//  22_NSTableViewCell
//
//  Created by 郭韬 on 15/11/25.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomTableCell.h"

@implementation CustomTableCell
//设置选择的背景颜色
- (void)setSelectionBackgroundColor:(NSColor *)cellColor
{
    _backgroundColor = cellColor;
}
//设置选择的字体颜色
- (void)setSelectionFontColor:(NSColor  *)cellFontColor
{
    _fontColor = cellFontColor;
}
//设置字体的属性
- (NSAttributedString *)getCellAttributes
{
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:_fontColor,NSForegroundColorAttributeName, nil];
    NSString *cellString = [self stringValue];
    
    _attributeString = [[NSAttributedString alloc] initWithString:cellString attributes:attributes];
    return _attributeString;
}
- (NSColor *)highlightColorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    NSRect newRect = NSMakeRect(cellFrame.origin.x - 1, cellFrame.origin.y, cellFrame.size.width + 5, cellFrame.size.height);
    if (_backgroundColor) {
        
        [_backgroundColor set];
        NSRectFill(newRect);
    }
    [self setAttributedStringValue:[self getCellAttributes]];
    return nil;
}

@end
