//
//  AppDelegate.h
//  McAnimation_NSViewAnimation
//
//  Created by Hao Tan on 12-5-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet NSView   *animationView;
}

@property (assign) IBOutlet NSWindow *window;

- (IBAction)startAnimation:(id)sender;

@end
