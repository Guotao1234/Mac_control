//
//  Document.m
//  18_NSViewController
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "Document.h"
#import "DepartmentViewController.h"
#import "EmployeeViewController.h"
@interface Document ()

@end

@implementation Document

- (instancetype)init {
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        viewControllers = [NSMutableArray array];
        ManagingViewController *vc;
        vc = [[DepartmentViewController alloc] initWithNibName:@"DepartmentView" bundle:[NSBundle mainBundle]];
        [vc setManagedObjectContext:[self managedObjectContext]];
       
        [viewControllers addObject:vc];
        
        vc = [[EmployeeViewController alloc] initWithNibName:@"EmployeeView" bundle:[NSBundle mainBundle]];
        [vc setManagedObjectContext:[self managedObjectContext]];
         NSLog(@"title = %@",vc.title);
        [viewControllers addObject:vc];
    }
    return self;
}
//创建切换的视图的方法
- (void)displayViewController:(ManagingViewController *)vc{
    //试着结束编辑
    NSWindow *window = [box window];
    BOOL isEnded = [window makeFirstResponder:window];
    
    if (!isEnded) {
        NSBeep();
        return;
    }
    //主窗口的window的大小
//    NSWindow *w1 = [[[self windowControllers] lastObject] window];
//    NSRect w1Rect = w1.frame;
    //将视图放在box中
    NSView *v = [vc view];
    //设计新的窗口尺寸
    NSSize currentSize = [box contentView].frame.size;
    NSSize newSize = v.frame.size;
    //计算多余的尺寸
    float deltaWidth = newSize.width - currentSize.width;
    float deltaHeight = newSize.height - currentSize.height;
    //window原来的长宽
    NSRect windowFrame = window.frame;
    //原来的宽度和高度增加
    windowFrame.size.height = currentSize.height + deltaHeight+100;
    windowFrame.size.width =currentSize.width + deltaWidth+100;
    //window的y值平移
    windowFrame.origin.y -= deltaHeight;
    //清除box，用于尺寸调整
    [box setContentView:nil];
    [window setFrame:windowFrame
             display:YES
             animate:YES];
    //box设置内容视图
    [box setContentView:v];
}
//设置菜单按钮的菜单项
- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
    NSMenu *menu = [popUp menu];
    //设置菜单选项对应的视图控制器
    for (int i = 0; i < [viewControllers count]; i++) {
        NSViewController *vc = [viewControllers objectAtIndex:i];
        //设置菜单项对应的方法，以及标题
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:[vc title] action:@selector(changeViewController:) keyEquivalent:@""];
        [item setTag:i];
        [menu addItem:item];
    }
    //初始化显示第一个视图控制器
    [self displayViewController:[viewControllers objectAtIndex:0]];
    //初始化选择的下标
    [popUp selectItemAtIndex:0];
}
- (IBAction)changeViewController:(id)sender{
    
    NSUInteger i  = [sender tag];
    ManagingViewController *vc = [viewControllers objectAtIndex:i];
    [self displayViewController:vc];
}
+ (BOOL)autosavesInPlace {
    return YES;
}

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"Document";
}

@end
