//
//  MyDocument.m
//  12_NibAndNSWindowController
//
//  Created by 郭韬 on 15/10/30.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyDocument.h"
#import "PreferenceController.h"

@implementation MyDocument
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//接受通知，覆写init方法
- (instancetype)init{
    
    self = [super init];
    if (self) {
        //接受通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleColorChange:) name:BNRColorChangedNotification object:nil];
    }
    return self;
}
//接受通知实现的方法
- (void)handleColorChange:(NSNotification *)note{
    NSColor *color = [note.userInfo objectForKey:@"changeColor"];
    //跟新tableView背景颜色
    [tableView setBackgroundColor:color];
    NSLog(@"note : %@",note.userInfo);
}
- (NSString *)windowNibName {
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController {
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
    NSUserDefaults *defaults = [NSUserDefaults  standardUserDefaults];
    NSData *colorAsData;
    colorAsData = [defaults objectForKey:BNRTableBgColorKey];
 
    [tableView setBackgroundColor:[NSKeyedUnarchiver unarchiveObjectWithData:colorAsData]];
    NSLog(@"tableViewColor = %@",[NSKeyedUnarchiver unarchiveObjectWithData:colorAsData]);
    [tableView reloadData];
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

+ (BOOL)autosavesInPlace {
    return YES;
}

@end
