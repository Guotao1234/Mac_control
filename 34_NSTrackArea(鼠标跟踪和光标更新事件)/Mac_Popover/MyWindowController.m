//
//  MyWindowController.m
//  Mac_Popover
//
//  Created by 郭韬 on 15/11/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyWindowController.h"
#import "MyViewController.h"
@interface MyWindowController ()

@end

@implementation MyWindowController
//初始化
- (void)awakeFromNib
{
    [customPopPosition setState:1 atRow:1 column:0];
}
- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (IBAction)showPopoverView:(id)sender
{
    
   // [self createPopover];
    
   // NSButton *targetButton = (NSButton *)sender;
    
    //设置偏移量
   // NSRectEdge edge = customPopPosition.selectedRow;
    //显示popoverView
    //[self.myPopover showRelativeToRect:[targetButton bounds] ofView:sender preferredEdge:edge];
}
- (void)createPopover
{
    if (self.myPopover == nil)
    {
        self.myPopover = [[NSPopover alloc] init];
    }
    //设置内容视图
    self.myPopover.contentViewController = myViewController;
    //设置pop出现后的样式
    /*
     APPKIT_EXTERN NSString * const NSAppearanceNameVibrantDark NS_AVAILABLE_MAC(10_10);
     APPKIT_EXTERN NSString * const NSAppearanceNameVibrantLight NS_AVAILABLE_MAC(10_10);

     */
    //self.myPopover.appearance = NSPopoverAppearanceMinimal;
    //设置默认弹出的动画
    self.myPopover.animates = YES;
    //设置pop行为
    self.myPopover.behavior = NSPopoverBehaviorTransient;
}
@end
