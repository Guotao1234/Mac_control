//
//  MyWindowController.h
//  Test4
//
//  Created by 郭韬 on 15/10/28.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyWindowController : NSWindowController

- (void)showModelFromWindow:(NSWindow *)sender;

@property (nonatomic,strong)NSWindow *mainWindow;
- (IBAction)okAction:(id)sender;
- (IBAction)dismissAction:(id)sender;
@end
