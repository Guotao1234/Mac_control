//
//  MyButton.h
//  T1
//
//  Created by 郭韬 on 15/11/17.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyButton : NSButton

@property (assign)CGFloat cornerRadius;
@property (strong)NSColor *backgroundColor;
@property (strong)NSColor *highlightColor;
@property (strong)NSColor *textColor;
@property (strong)NSColor *highlightTextColor;
@property (assign)NSEdgeInsets padding;

@property (assign) BOOL subpixelAntialiasing;


- (id)initWithHighlightColor:(NSColor *)highlightColor;
@end
