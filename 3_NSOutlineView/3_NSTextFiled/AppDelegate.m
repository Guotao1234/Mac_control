//
//  AppDelegate.m
//  3_NSTextFiled
//
//  Created by 郭韬 on 15/10/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomOutlineView.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSOutlineView *outlineView;

@property (weak) IBOutlet NSWindow *window;

@property (nonatomic,strong)NSArray *array;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.array = [NSArray array];
    NSTreeController *treeController = [[NSTreeController alloc] init];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"resource" ofType:@"xml"];
    NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
    //NSData *xmlData = [NSData dataWithContentsOfFile:@"resource.xml"];
    self.xmldoc = [[NSXMLDocument alloc] initWithData:xmlData options:1 error:nil];
    NSLog(@"children = %@",[self.xmldoc rootElement]);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
#pragma mark - DataSource

//返回指定子item说明
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item{
    
    return (item == nil) ?[self.xmldoc rootElement]:[(NSXMLElement*)item childAtIndex:index];
}
//返回是否item可扩展
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item{
    
    NSLog(@"count  = %lu",[item childCount]);
    return [(NSXMLElement *)item childCount] > 1;
}
//返回子item的个数
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item{
    
    return (item == nil)?1 : [(NSXMLElement *)item childCount];
}
//返回指定相关的item对象
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item{
    
    if ([item childCount] == 1) {
        
        return [(NSXMLElement *)item stringValue];
    }
    return [(NSXMLElement *)item name];
}
//设置每列中被给的Item对象
- (void)outlineView:(NSOutlineView *)outlineView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn byItem:(id)item{
    
}
@end
