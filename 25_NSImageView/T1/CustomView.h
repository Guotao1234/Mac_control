//
//  CustomView.h
//  T1
//
//  Created by 郭韬 on 16/3/17.
//  Copyright © 2016年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MyWindowController.h"
typedef void (^ChangePointBlock)(BOOL isShow);
@interface CustomView : NSView
{
    MyWindowController *myVC;
}
@property (nonatomic,strong)NSWindow *myWindow;
@property (nonatomic,copy)ChangePointBlock block;

@end
