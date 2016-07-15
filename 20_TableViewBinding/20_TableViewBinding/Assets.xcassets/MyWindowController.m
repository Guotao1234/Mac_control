//
//  MyWindowController.m
//  20_TableViewBinding
//
//  Created by 郭韬 on 15/11/6.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyWindowController.h"
#import "EditWindowController.h"
NSString *editWindowTitle = @"TableEdit";
@interface MyWindowController ()

@end

@implementation MyWindowController
- (void)dealloc{
    
    //移除监听者
    [contentArray removeObserver:self forKeyPath:@"selectionIndexes"];
}
- (void)awakeFromNib{
    //初始化开始监听contArray的变化
    [contentArray addObserver:self
                   forKeyPath:@"selectionIndexes"
                   options:NSKeyValueObservingOptionNew
                      context:nil];
    //初始化数组控制器
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                 @"Joe",@"firstname",
                                 @"Smith",@"lastname",
                                 @"(333)444-4444",@"phone",nil];
    [contentArray addObject:dict];
}
//接收属性变化调用的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSLog(@"KeyPath = %@,object = %@",keyPath,object);
}
- (void)inspect:(NSArray *)selectedObjects{
    
   // NSLog(@"selectedobjets = %@",selectedObjects);
    //NSLog(@"selectd = %@",[contentArray selectedObjects]);
    //从数组控制器取出选择的字典
    NSDictionary *dicItems = [selectedObjects objectAtIndex:0];
    if (editController == nil) {
        editController = [[EditWindowController alloc] initWithWindowNibName:editWindowTitle];
    }
    __weak EditWindowController *weakEditCtr = editController;
    //block的定义
    weakEditCtr.block = ^(NSDictionary *dic){
        //如果不是取消按钮则添加
        if (![weakEditCtr wasCancelled]) {
            
            [contentArray addObject:dic];
        }
        
    };
    [editController edit:dicItems from:self];
}

- (IBAction)addNumber:(id)sender{
    
    if (editController == nil) {
        editController = [[EditWindowController alloc] initWithWindowNibName:editWindowTitle];
    }
    __weak EditWindowController *weakEditCtr = editController;
    //block的定义
     weakEditCtr.block = ^(NSDictionary *dic){
         //如果不是取消按钮则添加
         if (![weakEditCtr wasCancelled]) {
             
             [contentArray addObject:dic];
         }
         
    };
    [editController edit:nil from:self];
}
- (IBAction)removeNumber:(id)sender{
    
}
- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
