//
//  MyDocument.m
//  NSAlert_Panels
//
//  Created by 郭韬 on 15/11/2.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyDocument.h"

@implementation MyDocument

- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:nil];
    }
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    if (outError) {
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:nil];
    }
    return NO;
}
- (BOOL)isEntireFileLoaded{
    
    return YES;
}
+ (BOOL)autosavesInPlace {
    return YES;
}
- (IBAction)removeEmployee:(id)sender{
    //选择的一个对象就是arrayController创建的绑定的一个对象
    NSArray *selectedPeople = [employeeController selectedObjects];
    //获取所选择的下表
    NSIndexSet *indexSet = [employeeController selectionIndexes];
    NSUInteger selectedInteger = indexSet.lastIndex;
    NSAlert *alert = [[NSAlert alloc] init];
    //1.增加Message信息
    alert.messageText = @"Delete";
    //2.增加提示信息
    alert.informativeText = [NSString stringWithFormat:@"Do you really want to delete %ld people",[selectedPeople count]];
    //3.增加按钮
    NSButton *button1 = [alert addButtonWithTitle:@"Delete"];
    //button1.s
    NSButton *button2 = [alert addButtonWithTitle:@"Cancel"];
    //4.把alert添加到tablview上,returnCode为按钮的状态
    [alert beginSheetModalForWindow:[tableView window]
                  completionHandler:^(NSModalResponse returnCode) {
                      //如果是右边第一个按钮
                      if (returnCode == NSAlertFirstButtonReturn) {
                          NSLog(@"删除按钮");
                          //删除所选择的下标的数组
                          [employeeController removeObjectAtArrangedObjectIndex:selectedInteger];
                      }
                     else if (returnCode == NSAlertSecondButtonReturn){
                          NSLog(@"取消所选择的按钮");
                      }
                       
                  }];
}
@end
