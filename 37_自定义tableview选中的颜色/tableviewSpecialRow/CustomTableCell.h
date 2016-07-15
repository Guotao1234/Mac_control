//
//  CustomTableCell.h
//  22_NSTableViewCell
//
//  Created by 郭韬 on 15/11/25.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomTableCell : NSCell
{
    NSColor             *_backgroundColor;
    NSColor             *_fontColor;
    NSAttributedString  * _attributeString;
}
@property(assign) BOOL importanted;

- (void)setSelectionBackgroundColor:(NSColor *)cellColor;
- (void)setSelectionFontColor:(NSColor  *)cellFontColor;
- (NSAttributedString *)getCellAttributes;
@end
