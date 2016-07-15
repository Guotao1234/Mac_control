//
//  MyWindowController.m
//  Test4
//
//  Created by 郭韬 on 15/10/28.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyWindowController.h"

@interface MyWindowController ()

@end

@implementation MyWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (NSString *)windowNibName{
    
    return @"NewWindow";
}
//sender为上一个window界面
- (void)showModelFromWindow:(NSWindow *)sender{
    
    self.mainWindow = sender;
    //注意勾选NSPanel的Behavior的选项
    [sender beginSheet:[self window]
     completionHandler:^(NSModalResponse returnCode) {
         
         if(returnCode == NSModalResponseStop){
             NSLog(@"dsdsd");
         }
     }];
    
//    [NSApp beginSheet:[self window]
//       modalForWindow:sender
//        modalDelegate:nil
//       didEndSelector:nil
//          contextInfo:nil];
    //开始时候在主window的中心模态弹出
   // [NSApp runModalForWindow:[self window]];
    
  //  [NSApp endSheet:[self window]];
    ////移除时候隐藏这个window,与stopModel相对应使用
   // [[self window] orderOut:self];
}
- (IBAction)okAction:(id)sender{
    
    [self.mainWindow endSheet:[self window]];
    //停止模态弹出这个window
  //  [NSApp stopModal];
}
- (IBAction)dismissAction:(id)sender{
    
    [NSApp stopModal];
}
@end
