//
//  AppDelegate.h
//  McAvatarViewTest
//
//  Created by TanHao on 12-12-31.
//  Copyright (c) 2012年 http://www.tanhao.me. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "McAvatarView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet McAvatarView *avatarView;
}

@property (weak) IBOutlet NSWindow *window;

- (IBAction)zoomChanged:(id)sender;

- (IBAction)saveClick:(id)sender;

@end
