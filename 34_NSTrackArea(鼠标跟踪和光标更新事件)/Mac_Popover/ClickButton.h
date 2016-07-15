//
//  ClickButton.h
//  Mac_Popover
//
//  Created by 郭韬 on 15/11/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MyViewController;
@interface ClickButton : NSButton
{
    BOOL isMouseIn;
    //设置Popover视图
    MyViewController  *myViewController;
}
@property (retain)NSPopover *popover;

@end
