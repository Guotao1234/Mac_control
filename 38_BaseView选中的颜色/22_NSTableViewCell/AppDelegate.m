//
//  AppDelegate.m
//  22_NSTableViewCell
//
//  Created by 郭韬 on 15/11/10.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTableRowView.h"
#import "CustomTableViewCell.h"


@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
static int i = 0;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
}
- (void)awakeFromNib{
    [self loadImageIcon];
    //设置显示背景颜色
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
    //取消行与行之间的的颜色
    [self.tableView setUsesAlternatingRowBackgroundColors:NO];
    [self.tableView setBackgroundColor:[NSColor grayColor]];
    //设置代理对象
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    //设置选中的颜色
    //CustomTableCell *cell = [[CustomTableCell alloc] init];
    //[cell setSelectionBackgroundColor:[NSColor greenColor]];
    //[[[self.tableView tableColumns] objectAtIndex:0] setDataCell:cell];
}
- (void)loadImageIcon{
    if (_iconImages == nil) {
        _iconImages = [[NSMutableArray alloc] init];
        // There is a set of images with the format "Image<number>.tiff" in the Resources directory. We go through and add them to the array until we are out of images.
        NSInteger i = 1;
        while (1) {
            // The typcast to a long and the use of %ld allows this application to easily be compiled as 32-bit or 64-bit
            NSString *imageName = [NSString stringWithFormat:@"Image%ld.tiff", (long)i];
            NSImage *image = [NSImage imageNamed:imageName];
            if (image != nil) {
                // Add the image to our array and loop to the next one
                [_iconImages addObject:image];
                i++;
            } else {
                // If the result is nil, then there are no more images
                break;
            }
        }
    }
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
   // NSLog(@"_iconCoumt = %@",_iconImages);
    return _iconImages.count;
}

//加载自定义视图(一次性把所有的视图都加载出来)
//Asks the delegate for a view to display the specified row and column
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    /*
     第一步：先在NSTableColumn设置identfier，通过identifier来确定所选的Column
     第二步：再在NSTableCellView设置identifier，通过这个当前的identifier来取出所定义的View
     第三步：最后NSTableCellView连接自己所定义的View
     */
   //取出当前列的标识符
    NSString *identifier = [tableColumn identifier];
    //通过标识符来给每一列的CellView进行设置数据
    if ([identifier isEqualToString:@"MainCell"]) {
        CustomTableViewCell *cellView = [tableView makeViewWithIdentifier:identifier owner:self];
        //取出自定义的View
        //[[NSNib alloc] initWithNibNamed:@"CustomCell" bundle:[NSBundle mainBundle]];
       //BOOL isSuccess = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:cellView topLevelObjects:nil];
        
        NSLog(@"cellView = %@",cellView.imageView);
        cellView.imageView.image = _iconImages[row];
        NSLog(@"cellView = %@",cellView.imageView.image);
        cellView.myTextField.stringValue = [NSString stringWithFormat:@"test %d",i];
        NSLog(@"count = %i",i++);
        return cellView;
    }
    return nil;
}
- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    
    //NSLog(@"row = %ld",row);
    return YES;
}
//增加一行
//在选中的行下面增加一行
- (IBAction)addSelectedRoe:(id)sender
{
    NSString *imageName = [NSString stringWithFormat:@"Image%ld.tiff", (long)1];
    NSImage *image = [NSImage imageNamed:imageName];
    NSInteger selectedRow = [self.tableView selectedRow];
    selectedRow++;
    
    [_iconImages insertObject:image atIndex:0];
    //插入数据到首行上面
    [_tableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:0] withAnimation:NSTableViewAnimationEffectGap];
}
//删除选择的行
- (IBAction)removeSelectedRow:(id)sender
{
    NSIndexSet *indexes = [self.tableView selectedRowIndexes];
    //从数组中把选中的行的数据删除
    [_iconImages removeObjectsAtIndexes:indexes];
    //把选中都行从当前的表格中移除
    [_tableView removeRowsAtIndexes:indexes withAnimation:NSTableViewAnimationSlideDown];
}
//Asks the delegate for a custom data cell for the specified row and column.
/*
 - (NSView *)tableView:(NSTableView *)tableView viewForTableColumn和
 - (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn
 一起用会先执行NSView的方法，而NSCell不会被执行
 NSCell 自定义选择的cell以及字体选择的颜色，
 */
/*- (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    //通过标识符，来设置每列的Cell
    NSLog(@"dsdsdsdsd");
    NSString *identifier = [tableColumn identifier];
    if ([identifier isEqualToString:@"MainCell"])
    {
        //自定义Cell
        CustomTableCell *cell = [[CustomTableCell alloc] init];
        [cell setSelectionBackgroundColor:[NSColor greenColor]];
        return cell;
    }
    
    return nil;
}
 */
//自定义选中行的高亮的颜色
- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row{
    
    MyTableRowView *rowView = [[MyTableRowView alloc] init];
    return rowView;
}
@end
