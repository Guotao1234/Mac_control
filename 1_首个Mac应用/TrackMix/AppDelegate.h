//
//  AppDelegate.h
//  TrackMix
//
//  Created by 郭韬 on 15/10/22.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Track;
@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong)Track *track;
- (IBAction)mute:(id)sender;

- (IBAction)takeFloatValueForVolumeFrom:(id)sender;

- (void)updataUserInterface;
@end

