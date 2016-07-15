//
//  AppDelegate.h
//  McAnimation_CABaseAnimation_Extend
//
//  Created by TanHao on 12-12-15.
//  Copyright (c) 2012年 tanhao.me. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class THPanelView;
@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet THPanelView *panelView;
}

@property (assign) IBOutlet NSWindow *window;

@end
