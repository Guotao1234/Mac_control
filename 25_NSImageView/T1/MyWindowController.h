//
//  MyWindowController.h
//  T1
//
//  Created by 郭韬 on 15/11/16.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
//自定义NSImageView响应点击事件
@class MyImageView;
@class PersonWindowController;
@interface MyWindowController : NSWindowController
{
    IBOutlet MyImageView *_imageView;
    IBOutlet NSButton   *clickButton;
    PersonWindowController *personWindowCtr;
    NSEvent *_event;
}
+(MyWindowController *)shareInsdtance;
@end
