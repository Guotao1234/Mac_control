//
//  MyWindowController.h
//  Mac_Popover
//
//  Created by 郭韬 on 15/11/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MyViewController;
@interface MyWindowController : NSWindowController<NSPopoverDelegate>
{
    @private
    NSPopover *_myPopover;
    
    //配置UI界面
    IBOutlet NSMatrix *customPopPosition;
    IBOutlet MyViewController *myViewController;
}
@property (strong)NSPopover *myPopover;
- (IBAction)showPopoverView:(id)sender;
@end
