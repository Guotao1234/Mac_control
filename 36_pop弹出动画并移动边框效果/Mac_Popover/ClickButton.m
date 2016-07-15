//
//  ClickButton.m
//  Mac_Popover
//
//  Created by 郭韬 on 15/11/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "ClickButton.h"
#import "MyViewController.h"
@implementation ClickButton

#define STATE_ON	1.0f
#define STATE_OVER	0.7f
#define STATE_OFF	0.25f

- (void)awakeFromNib{
    //An NSTrackingArea object defines a region of view that generates mouse-tracking and cursor-update events when the mouse is over that region
    //NSTrackingArea 定义了鼠标在该区域的时候，生成鼠标跟踪和光标更新事件
    NSTrackingArea *trackingArea;
    
    trackingArea = [[NSTrackingArea alloc] initWithRect:[self bounds]
                                                options: (NSTrackingMouseEnteredAndExited | NSTrackingActiveInActiveApp)
                                                  owner:self
                                               userInfo:nil];
    
    //area object to a view using the addTrackingArea: method. Depending on the options specified, the owner of the tracking area receives mouseEntered:, mouseExited:, mouseMoved:, and cursorUpdate:
    //为当前对象添加一个跟踪者
    [self addTrackingArea:trackingArea];
    
    [self setAlphaValue:STATE_OFF];
    
    //创建pop视图
    if (myViewController == nil) {
        
        myViewController = [[MyViewController alloc] initWithNibName:@"PopoverView" bundle:nil];
    }
}
- (void)createPopView{
    
    if (self.popover == nil) {
        
        self.popover = [[NSPopover alloc] init];
    }
    self.popover.contentViewController = myViewController;
    self.popover.animates = YES;
    self.popover.behavior = NSPopoverBehaviorTransient;
    [self.popover showRelativeToRect:[self bounds] ofView:self preferredEdge:1];
}
- (void)mouseEntered:(NSEvent *)theEvent{
    isMouseIn = YES;
    NSLog(@"鼠标进入这个范围");
    if ([self state] == NSOffState) {
        //设置动画
        [self.animator setAlphaValue:STATE_OVER];
    }
    [self createPopView];
}

- (void)mouseExited:(NSEvent *)theEvent{
    isMouseIn = NO;
    //[self.popover close];
    NSLog(@"鼠标推出这个范围");
    NSTimeInterval time = 100.0;
    [self performSelector:@selector(closePopover) withObject:self afterDelay:time];
    
    if ([self state] == NSOffState) {
        [self.animator setAlphaValue:STATE_OFF];
    }
}
- (void)closePopover{
    [self.popover close];
    NSLog(@"关闭pop视图");
}
- (void)mouseDown:(NSEvent *)theEvent{
    NSLog(@"鼠标按下");
    if ([self state] == NSOnState) {
        [self setState:NSOffState];
        if (isMouseIn) {
            [self setAlphaValue:STATE_OVER];
        }
        else {
            [self setAlphaValue:STATE_OFF];
        }
    }
    else {
        [self setState:NSOnState];
        [self setAlphaValue:STATE_ON];
    }
}

-(void)mouseUp:(NSEvent *)theEvent{
    NSLog(@"鼠标按下取消");
    // [[self target] performSelector:[self action]];
}

- (void)rightMouseDown:(NSEvent *)theEvent{
    //设置菜单项
    NSMenu *mContextualMenu = [[NSMenu alloc] initWithTitle:@"Menu Title"];
    NSMenuItem *menuItem;
    for (int i = 0; i < 10 ; i ++ ) {
        
        menuItem = [[NSMenuItem alloc] initWithTitle:[NSString stringWithFormat:@"Menu Item %d",i] action:@selector(clickButton:) keyEquivalent:@""];
        menuItem.tag = i;
        [mContextualMenu addItem:menuItem];
    }
    //右击时显示菜单栏
    [NSMenu popUpContextMenu:mContextualMenu withEvent: theEvent forView:self withFont: [NSFont menuFontOfSize: 11]];
}

- (void)rightMouseUp:(NSEvent *)theEvent{
}
- (void)clickButton:(id)sender
{
   // NSMenuItem *menuItem = sender;
   // NSLog(@"menuItem  = %ld",menuItem.tag);
    
}
@end
