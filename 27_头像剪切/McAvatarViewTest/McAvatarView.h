//
//  NSAvatarView.h
//  IKImageTest
//
//  Created by TanHao on 12-12-26.
//  Copyright (c) 2012年 http://www.tanhao.me All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface McAvatarView : NSView
{
    NSPoint lastPoint;
    BOOL dragFlag;
    
    CGImageSourceRef imageSource;
    NSImage *image;
    //图片实际像素
    double imageWidth;
    double imageHeight;
    //绘制时整个图片的frame
    NSRect drawRect;
}

@property (nonatomic, strong) NSString *imagePath;
//缩放比例，默认为1.0，以最大的区域截裁剪,该值区间为1.0到maxZoom
@property (nonatomic, assign) double zoom;
//能够缩放的最大倍数，当Zoom取该值时，图片以实际像素大小裁剪
@property (nonatomic, readonly) double maxZoom;

//裁剪后的图片
- (NSImage *)screenShot;

@end
