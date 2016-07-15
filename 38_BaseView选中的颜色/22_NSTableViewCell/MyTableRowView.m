//
//  MyTableRowView.m
//  22_NSTableViewCell
//
//  Created by 郭韬 on 15/11/26.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyTableRowView.h"

@implementation MyTableRowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
//改变点击后的颜色
- (void)drawSelectionInRect:(NSRect)dirtyRect{
    if (self.selectionHighlightStyle != NSTableViewSelectionHighlightStyleNone) {
        NSRect selectionRect = NSInsetRect(self.bounds, 2.5, 2.5);
        [[NSColor colorWithCalibratedWhite:.65 alpha:1.0] setStroke];
        [[NSColor colorWithCalibratedWhite:.82 alpha:1.0] setFill];
        //画出选择的路径
        NSBezierPath *selectionPath = [NSBezierPath bezierPathWithRoundedRect:selectionRect xRadius:6 yRadius:6];
        NSBezierPath *selectionPath1 = [NSBezierPath bezierPathWithRect:self.bounds];
        [selectionPath1 fill];
        [selectionPath1 stroke];
        
    }
    
}


@end
