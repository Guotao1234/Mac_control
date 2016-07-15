//
//  AppDelegate.m
//  22_NSToolBar
//
//  Created by 郭韬 on 15/11/11.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#define SimpleToolbarItemIdentifier @"toolbarItemIdentifier"
#define SimpleSpaceToolbarItemIdentifier @"spaceItemIdentifier"
@interface AppDelegate ()<NSToolbarDelegate>

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

//NSToolBar标签栏按钮的图标是32*32
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [self layoutToolBar];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
//使用代码来创建工具栏、
- (void)layoutToolBar
{
    //通过identifier初始化toolbar
    NSToolbar *toolbar = [[NSToolbar alloc] initWithIdentifier:@"SimpleToolbar"];
    [toolbar setAllowsUserCustomization:NO];
    [toolbar setAutosavesConfiguration:NO];
    [toolbar setDisplayMode:NSToolbarDisplayModeIconOnly];
    [toolbar setSizeMode:NSToolbarSizeModeSmall];
    [toolbar setDisplayMode:NSToolbarDisplayModeIconOnly];
    
    toolbar.delegate = self;
    [self.window setToolbar:toolbar];
    
}
#pragma mark - NSToolbarDelegate
//允许使用哪些标识符(就是可以含有哪些item，标识符不可以重复)
- (NSArray <NSString *>*)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar
{
    return @[SimpleToolbarItemIdentifier,SimpleSpaceToolbarItemIdentifier];
}
//默认使用哪些标识符(就是允许的标识符的item 的排序，标识符可以重复排)
- (NSArray <NSString *>*)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar
{
    return @[SimpleSpaceToolbarItemIdentifier,SimpleSpaceToolbarItemIdentifier,SimpleToolbarItemIdentifier];
}
//为每个标识符提供对应的item
- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
    NSLog(@"identifier = %@",itemIdentifier);
    NSToolbarItem *toolbarItem = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
    if ([itemIdentifier isEqualToString:SimpleToolbarItemIdentifier]) {
        
        [toolbarItem setLabel:@"Add"];
        [toolbarItem setPaletteLabel:@"Add"];
        [toolbarItem setToolTip:@"Add"];
        [toolbarItem setImage:[NSImage imageNamed:@"search"]];
        
        [toolbarItem setMinSize:CGSizeMake(16, 16)];
        [toolbarItem setMaxSize:CGSizeMake(100, 100)];
        
        [toolbarItem setTarget:self];
        [toolbarItem setAction:@selector(addAction:)];
    }
    else if([itemIdentifier isEqualToString:SimpleSpaceToolbarItemIdentifier]){
        [toolbarItem setLabel:@"Space"];
        [toolbarItem setPaletteLabel:@""];
        [toolbarItem setToolTip:@""];

    }
    return toolbarItem;
}
- (void)addAction:(id)sender
{
    NSLog(@"点击搜索栏");
}
@end
