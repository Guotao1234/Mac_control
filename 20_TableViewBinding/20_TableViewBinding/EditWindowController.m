//
//  EditWindowController.m
//  20_TableViewBinding
//
//  Created by 郭韬 on 15/11/6.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "EditWindowController.h"
#import "MyWindowController.h"
@interface EditWindowController ()

@end

@implementation EditWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (NSString *)windowNibName
{
    return @"TableEdit";
}
////返回一个编辑的字典，并且模态弹出另一个window
- (NSDictionary *)edit:(NSDictionary *)startingValues from:(MyWindowController *)sender{
    myWindoeCtr = sender;
    cancelled = NO;
    //模态弹出视图
    [sender.window beginSheet:self.window  completionHandler:^(NSModalResponse returnCode) {
        //显示数据的回调
        self.block(saveFields);
        NSLog(@"return = %ld",returnCode);
    }];
    //取出当前的cell
    NSArray *editForms= [editForm cells];
    if (startingValues != nil) {
        //如果双击的话就显示双击的内容
        [[editForms objectAtIndex:0] setStringValue:[startingValues objectForKey:@"firstname"]];
        [[editForms objectAtIndex:1] setStringValue:[startingValues objectForKey:@"lastname"]];
        [[editForms objectAtIndex:2] setStringValue:[startingValues objectForKey:@"phone"]];
    }else{
        
        [[editForms objectAtIndex:0] setStringValue:@""];
        [[editForms objectAtIndex:1] setStringValue:@""];
        [[editForms objectAtIndex:2] setStringValue:@""];
    }
    return nil;
}
- (IBAction)addbButton:(id)sender{
    
    //保持添加的值
    NSArray *editFields = [editForm cells];
    
    saveFields = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                  [[editFields objectAtIndex:0] stringValue],@"firstname",
                  [[editFields objectAtIndex:1] stringValue],@"lastname",
                  [[editFields objectAtIndex:2] stringValue],@"phone" ,nil];
    [myWindoeCtr.window endSheet:self.window];
}
- (IBAction)cancelButton:(id)sender{
    cancelled = YES;
    //取消当前的视图
    [myWindoeCtr.window endSheet:self.window];
}
//返回当前的BOOL值
- (BOOL)wasCancelled{
    
    return cancelled;
}
@end
