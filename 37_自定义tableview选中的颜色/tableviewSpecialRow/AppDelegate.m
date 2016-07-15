//
//  AppDelegate.m
//  tableviewSpecialRow
//
//  Created by X on 2014-12-10.
//  Copyright (c) 2014 Beyondcow. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTableCell.h"
#import "ColorTextFieldCell.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return 10;
}


- (id)tableView:(NSTableView *)aTableView
objectValueForTableColumn:(NSTableColumn *)aTableColumn
            row:(NSInteger)rowIndex

{
    if (rowIndex==3) {
        return @"aaaaaa";
    }
    return @"ssss";
}

- (void)tableView:(NSTableView *)aTableView
  willDisplayCell:(id)aCell
   forTableColumn:(NSTableColumn *)aTableColumn
              row:(NSInteger)rowIndex
{
    //CustomTableCell *cell = (CustomTableCell*) aCell;
   // cell.importanted = rowIndex==3;
}

/*
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    NSLog(@"dsdsd");
    return nil;
}
*/
/*
 - (NSView *)tableView:(NSTableView *)tableView viewForTableColumn和
 - (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn
 一起用会先执行NSView的方法，而NSCell不会被执行
 */
- (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    
    NSString *identifier = [tableColumn identifier];
    if ([identifier isEqualToString:@"MainCell"])
    {
        //自定义Cell
        CustomTableCell *cell = [[CustomTableCell alloc] init];
        //必须写stringValue的值
        cell.stringValue = @"";
        [cell setSelectionBackgroundColor:[NSColor grayColor]];
        //[cell setSelectionFontColor:[NSColor redColor]];
        return cell;
    }
    return nil;
}

@end
