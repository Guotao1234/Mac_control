//
//  Document.h
//  18_NSViewController
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class ManagingViewController;
@interface Document : NSPersistentDocument{
    
    IBOutlet NSBox *box;
    IBOutlet NSPopUpButton *popUp;
    NSMutableArray *viewControllers;
}
//切换视图控制器
- (void)displayViewController:(ManagingViewController *)vc;
- (IBAction)changeViewController:(id)sender;
@end
