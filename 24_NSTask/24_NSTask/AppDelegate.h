//
//  AppDelegate.h
//  24_NSTask
//
//  Created by 郭韬 on 15/11/16.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    
    IBOutlet NSTextView   *outputView;
    IBOutlet NSTextField  *hostField;
    IBOutlet NSButton     *startButton;
    NSTask                *task;
    NSPipe                *pipe;
}
- (IBAction)startStopPing:(id)sender;

@end

