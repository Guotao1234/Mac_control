//
//  AppDelegate.h
//  22_NSTableViewCell
//
//  Created by 郭韬 on 15/11/10.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSTableViewDataSource,NSTableViewDelegate>{
    
    //设定图片数组
    NSMutableArray *_iconImages;
    IBOutlet NSView *_view;
}

@property (assign)IBOutlet NSTableView *tableView;
- (IBAction)removeSelectedRow:(id)sender;
@end

