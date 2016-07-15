//
//  CustomView.m
//  Mac_Test_5
//
//  Created by 郭韬 on 16/3/24.
//  Copyright © 2016年 33e9. All rights reserved.
//

#import "CustomView.h"
@interface CustomView() {
    NSColor* backColor;
}
@end
@implementation CustomView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    
    if (backColor == nil) {
        float rand_max = RAND_MAX;
        float red = rand() / rand_max;
        float green = rand() / rand_max;
        float blue = rand() / rand_max;
        backColor = [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:1.0];
    }
    
    [backColor set];
    NSRectFill(self.bounds);

    // Drawing code here.
}

@end
