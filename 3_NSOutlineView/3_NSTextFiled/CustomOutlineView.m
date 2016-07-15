//
//  CustomOutlineView.m
//  3_NSTextFiled
//
//  Created by 郭韬 on 15/10/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomOutlineView.h"
#import "CustomModel.h"

@implementation CustomOutlineView

- (instancetype)initWithFrame:(NSRect)frameRect{
    
    self = [super initWithFrame:frameRect];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"resource" ofType:@"xml"];
        NSData *xmlData = [[NSData alloc] initWithContentsOfFile:filePath];
        //NSData *xmlData = [NSData dataWithContentsOfFile:@"resource.xml"];
       
        self.xmldoc = [[NSXMLDocument alloc] initWithData:xmlData options:1 error:nil];
         NSArray *priceElements = [self.xmldoc nodesForXPath:@"/" error:nil];
    }
    return  self;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
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
#pragma mark - Delegate
//每列的item的样式
- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item{
  
    return nil;
}

@end
