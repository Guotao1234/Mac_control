//
//  AppDelegate.h
//  Test4
//
//  Created by 郭韬 on 15/10/28.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MyWindowController;
@interface AppDelegate : NSObject <NSApplicationDelegate>{
    
    MyWindowController *myWindowController;
}

- (IBAction)addNewWindow:(id)sender;
- (IBAction)cancelAction:(id)sender;
@end

