//
//  EditWindowController.h
//  20_TableViewBinding
//
//  Created by 郭韬 on 15/11/6.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MyWindowController;
typedef void(^backBlock)(NSDictionary *);
@interface EditWindowController : NSWindowController{
    
    MyWindowController *myWindoeCtr;
    BOOL cancelled;
    NSDictionary *saveFields;
    
    IBOutlet NSForm *editForm;
}
@property (nonatomic,copy)backBlock block;
//返回一个编辑的字典，并且模态弹出另一个window
- (NSDictionary *)edit:(NSDictionary *)startingValues from:(MyWindowController *)sender;
//增加按钮
- (IBAction)addbButton:(id)sender;
//取消按钮
- (IBAction)cancelButton:(id)sender;

- (BOOL)wasCancelled;
@end
