//
//  MyDocument.h
//  NSAlert_Panels
//
//  Created by 郭韬 on 15/11/2.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyDocument : NSDocument{
    
    IBOutlet NSArrayController *employeeController;
    IBOutlet NSTableView *tableView;
}

- (IBAction)removeEmployee:(id)sender;
@end
