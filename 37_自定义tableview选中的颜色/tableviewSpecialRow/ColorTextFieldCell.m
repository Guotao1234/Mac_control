//
//  ColorTextFieldCell.m
//  tableviewSpecialRow
//
//  Created by X on 2014-12-10.
//  Copyright (c) 2014 Beyondcow. All rights reserved.
//

#import "ColorTextFieldCell.h"

@implementation ColorTextFieldCell

- (void)drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
    if (self.importanted) {
        [[NSColor redColor] set];
        NSRectFill(cellFrame);
    }
    [super drawWithFrame:cellFrame inView:controlView];
}

@end
