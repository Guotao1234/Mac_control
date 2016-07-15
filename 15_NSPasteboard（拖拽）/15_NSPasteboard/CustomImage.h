//
//  CustomImage.h
//  15_NSPasteboard
//
//  Created by 郭韬 on 15/12/8.
//  Copyright © 2015年 33e9. All rights reserved.
//
//自定义图片的拖拽
#import <Cocoa/Cocoa.h>

@interface CustomImage : NSImageView<NSDraggingSource,NSPasteboardItemDataProvider>

@property (nonatomic,strong)NSEvent *mouseEvent;
@end
