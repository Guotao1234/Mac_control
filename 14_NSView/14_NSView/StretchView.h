//
//  StretchView.h
//  14_NSView
//
//  Created by 郭韬 on 15/11/2.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StretchView : NSView{
    NSImage *image;
    NSBezierPath *path;
    float _opacity;
}
- (NSPoint)randomPoint;
- (void)setImage:(NSImage *)newImage;
@property (nonatomic,assign)float opacity;
@end
