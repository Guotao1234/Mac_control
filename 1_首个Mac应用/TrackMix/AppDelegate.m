//
//  AppDelegate.m
//  TrackMix
//
//  Created by 郭韬 on 15/10/22.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "Track.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSSlider *slider;


@end

@implementation AppDelegate

@synthesize textField = _textField;
@synthesize slider = _slider;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    Track *atrack = [[Track alloc] init];

    self.track = atrack;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
//把textFiled和slider的值置为零
- (IBAction)mute:(id)sender {
    
    //NSLog(@"received a mute : message");
    self.track.volume = 0.0;
    [self updataUserInterface];
}

//为textFiled和slider控件共用一个方法出口
- (IBAction)takeFloatValueForVolumeFrom:(id)sender {
    
    /*
    NSString *senderName = nil;
    if (sender == self.textField) {
        
        senderName = @"textField";
    }else{
        
        senderName = @"slider";
     
    }
    NSLog(@"%@ sent takeFloatValueForVoluymeForm withValue %1.2f",senderName,[sender floatValue]);
    */
    float newValue = [sender floatValue];
    [self.track setVolume:newValue];
    [self updataUserInterface];
}
- (void)updataUserInterface{
    
    float volume = self.track.volume;
    //为textFiled设置值
    [self.textField setFloatValue:volume];
    //为slider设置值
    [self.slider setFloatValue:volume];
}
@end
