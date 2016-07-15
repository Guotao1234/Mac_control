//
//  MyWindowController.h
//  20_TableViewBinding
//
//  Created by 郭韬 on 15/11/6.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class EditWindowController;
@interface MyWindowController : NSWindowController
{
    IBOutlet NSTableView        *tableView;
    IBOutlet NSArrayController  *contentArray;
    
    IBOutlet NSButton           *adButton;
    IBOutlet NSButton           *deleteButton;
    
    EditWindowController        *editController;
}
//双击点击tableview
- (void)inspect:(NSArray *)selectedObjects;

- (IBAction)addNumber:(id)sender;
- (IBAction)removeNumber:(id)sender;
@end
