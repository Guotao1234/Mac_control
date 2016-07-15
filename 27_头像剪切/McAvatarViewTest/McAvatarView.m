//
//  NSAvatarView.m
//  IKImageTest
//
//  Created by TanHao on 12-12-26.
//  Copyright (c) 2012年 http://www.tanhao.me All rights reserved.
//

#import "McAvatarView.h"

#define kMcAvatarShadowPercent (0.2)

NS_INLINE NSRect INTRect(NSRect rect)
{
    return NSMakeRect(round(rect.origin.x), round(rect.origin.y), round(rect.size.width), round(rect.size.height));
}

@implementation McAvatarView
@synthesize imagePath;
@synthesize zoom;
@synthesize maxZoom;

- (void)dealloc
{
    if (imageSource)
    {
        CFRelease(imageSource);
        imageSource = NULL;
    }
}

- (NSString *)imagePath
{
    return imagePath;
}

- (void)setImagePath:(NSString *)imgPath
{
    imagePath = imgPath;
    
    if (imageSource)
    {
        CFRelease(imageSource);
        imageSource = NULL;
    }
    //CGImageSource是对图像数据读取任务的抽象，通过它可以获得图像对象、缩略图、图像的属性
    imageSource = CGImageSourceCreateWithURL((__bridge CFURLRef)[NSURL fileURLWithPath:imagePath],NULL);
    if (!imageSource) return;
    //获取图像的属性信息
    CFDictionaryRef imageInfo = CGImageSourceCopyPropertiesAtIndex(imageSource, 0,NULL);
    //像素的宽
    NSNumber *pixelWidthObj = (__bridge NSNumber *)CFDictionaryGetValue(imageInfo, kCGImagePropertyPixelWidth);
    //像素的高
    NSNumber *pixelHeightObj = (__bridge NSNumber *)CFDictionaryGetValue(imageInfo, kCGImagePropertyPixelHeight);
    //图像的旋转方向
    NSInteger orientation = [(__bridge NSNumber *)CFDictionaryGetValue(imageInfo, kCGImagePropertyOrientation) integerValue];
    CFRelease(imageInfo);
    
    //原始像素的宽与高与实际显示的宽高与旋转方式有关系
    /*
     UIImageOrientationUp:              1 正常方向(默认值)
     UIImageOrientationUpMirrored:      2 将原图水平的翻转到背面
     UIImageOrientationDown:            3 旋转180度(朝左朝右当然是一样的)
     UIImageOrientationDownMirrored:    4 在水平翻转之后再旋转180度
     UIImageOrientationLeftMirrored:    5 在水平翻转之后向左逆时针旋转90度
     UIImageOrientationRight:           6 向右顺时针旋转90度
     UIImageOrientationRightMirrored:   7 在水平翻译之后向右顺时针旋转90度
     UIImageOrientationLeft:            8 向左逆时针旋转90度
     */
    if (orientation == 5 ||
        orientation == 6 ||
        orientation == 7 ||
        orientation == 8) {
        imageWidth = [pixelHeightObj doubleValue];
        imageHeight = [pixelWidthObj doubleValue];
    }else{
        imageWidth = [pixelWidthObj doubleValue];
        imageHeight = [pixelHeightObj doubleValue];
    }
    
    double viewWidth = NSWidth([self avatarRect]);
    double viewHeight = NSHeight([self avatarRect]);
    
    if (imageWidth < viewWidth || imageWidth < viewHeight)
    {
        maxZoom = 1.0;
    }else if (imageWidth/imageHeight > viewWidth/viewHeight)
    {
        maxZoom = imageHeight/viewHeight;
    }else
    {
        maxZoom = imageWidth/viewWidth;
    }
    
    [self setZoom:1.0];
}

- (double)zoom
{
    return zoom;
}

- (void)setZoom:(double)value
{
    if (value > maxZoom) {
        value = maxZoom;
    }
    if (value < 1.0) {
        value = 1.0;
    }
    zoom = value;
    
    NSSize drawSize = NSMakeSize(zoom*(imageWidth/maxZoom), zoom*(imageHeight/maxZoom));;
    NSPoint drawPoint = NSMakePoint(NSMidX([self avatarRect])-drawSize.width/2,
                                    NSMidY([self avatarRect])-drawSize.height/2);
    drawRect = NSMakeRect(drawPoint.x, drawPoint.y, drawSize.width, drawSize.height);
    
    //当需要绘制的大小超过缩略图的大小，则重新创建更大尺寸的缩略图
    if (!image || NSWidth(drawRect) > image.size.width)
    {
        //缩略图按self尺寸的倍数创建
        double currentThumbnailZoom = ceil(NSWidth(drawRect)/NSWidth([self bounds]));
        double thumbnailWidth = currentThumbnailZoom*NSWidth([self bounds]);
        thumbnailWidth = MIN(thumbnailWidth,imageWidth);
        double thumbnailHeight = (thumbnailWidth/imageWidth)*imageHeight;
        
        NSDictionary *thumbnailInfo = @{
        (NSString *)kCGImageSourceShouldCache : @NO,
        (NSString *)kCGImageSourceCreateThumbnailFromImageAlways : @YES,
        (NSString *)kCGImageSourceThumbnailMaxPixelSize : [NSNumber numberWithInt:MAX(thumbnailWidth,thumbnailHeight)],
        (NSString *)kCGImageSourceCreateThumbnailWithTransform : @YES,
        };
        CGImageRef imageRef = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, (__bridge CFDictionaryRef)thumbnailInfo);
        image = [[NSImage alloc] initWithCGImage:imageRef size:NSMakeSize(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef))];
        [image setCacheMode:NSImageCacheNever];
        CGImageRelease(imageRef);
    }
    
    [self setNeedsDisplay:YES];
}

- (double)avatarInsetWidth
{
    return NSWidth(self.bounds)*kMcAvatarShadowPercent;
}

- (double)avatarInsetHeight
{
    return NSHeight(self.bounds)*kMcAvatarShadowPercent;
}

- (NSRect)avatarRect
{
    return NSInsetRect(self.bounds, [self avatarInsetWidth], [self avatarInsetHeight]);
}

- (void)drawRect:(NSRect)dirtyRect
{
    //计算只绘制需要重绘的部分图片
    double scale = image.size.width/NSWidth(drawRect);
    NSPoint distancePoint = NSMakePoint(NSMinX(dirtyRect)-NSMinX(drawRect), NSMinY(dirtyRect)-NSMinY(drawRect));
    NSRect dirtyImageRect = NSMakeRect(distancePoint.x*scale,
                                      distancePoint.y*scale,
                                      NSWidth(dirtyRect)*scale,
                                      NSHeight(dirtyRect)*scale);
    [image drawInRect:dirtyRect fromRect:INTRect(dirtyImageRect) operation:NSCompositeCopy fraction:1.0];
    
    //重绘整张图片
    //[[NSBezierPath bezierPathWithRect:dirtyRect] addClip];
    //[image drawInRect:INTRect(drawRect) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    
    //绘制周围非选择区域
    [[NSColor colorWithCalibratedRed:160/255.0 green:160/255.0 blue:160/255.0 alpha:0.8] set];
    NSBezierPath *path = [NSBezierPath bezierPathWithRect:NSInsetRect([self avatarRect], -[self avatarInsetWidth]/2, -[self avatarInsetHeight]/2)];
    [path setLineWidth:MAX([self avatarInsetWidth], [self avatarInsetHeight])];
    [path stroke];
}

- (void)mouseDragged:(NSEvent *)theEvent
{
    NSPoint point = [theEvent locationInWindow];
    point = [self convertPoint:point fromView:nil];
    
    if (!dragFlag)
    {
        dragFlag = YES;
    }else
    {
        if (NSWidth(drawRect)>NSWidth([self avatarRect]))
        {
            drawRect.origin.x += (point.x-lastPoint.x);
            if (NSMinX(drawRect) > NSMinX([self avatarRect])) {
                drawRect.origin.x = NSMinX([self avatarRect]);
            }
            if (NSMaxX(drawRect) < NSMaxX([self avatarRect])) {
                drawRect.origin.x = NSMaxX([self avatarRect])-NSWidth(drawRect);
            }
        }
        
        if (NSHeight(drawRect)>NSHeight([self avatarRect]))
        {
            drawRect.origin.y += (point.y-lastPoint.y);
            if (NSMinY(drawRect) > NSMinY([self avatarRect])) {
                drawRect.origin.y = NSMinY([self avatarRect]);
            }
            if (NSMaxY(drawRect) < NSMaxY([self avatarRect])) {
                drawRect.origin.y = NSMaxY([self avatarRect])-NSHeight(drawRect);
            }
        }
    }
    lastPoint = point;
    
    [self setNeedsDisplay:YES];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    [[NSCursor closedHandCursor] set];
}

- (void)mouseUp:(NSEvent *)theEvent
{
    [[NSCursor arrowCursor] set];
    dragFlag = NO;
}

- (NSImage *)screenShot
{
    NSImage *img = [[NSImage alloc] initWithSize:[self avatarRect].size];
    NSRect screenRect = drawRect;
    screenRect.origin.x -= [self avatarInsetWidth];
    screenRect.origin.y -= [self avatarInsetHeight];
    [img lockFocus];
    [image drawInRect:screenRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
    [img unlockFocus];
    return img;
}

@end
