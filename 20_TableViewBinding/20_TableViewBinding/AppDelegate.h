//
//  AppDelegate.h
//  20_TableViewBinding
//
//  Created by 郭韬 on 15/11/6.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class MyWindowController;
@interface AppDelegate : NSObject <NSApplicationDelegate>{
    MyWindowController *myWindowController;
}

- (IBAction)OpenReadMe:(id)sender;
@end

