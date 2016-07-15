//
//  AppDelegate.m
//  McAvatarViewTest
//
//  Created by TanHao on 12-12-31.
//  Copyright (c) 2012年 http://www.tanhao.me. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    avatarView.imagePath = [[NSBundle bundleForClass:self.class] pathForImageResource:@"test.png"];
}

- (IBAction)zoomChanged:(id)sender
{
    float sliderPre = 0.01*[(NSSlider *)sender doubleValue];
    
    [avatarView setZoom:1.0+(avatarView.maxZoom-1.0)*sliderPre];
}

- (IBAction)saveClick:(id)sender
{
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    [savePanel setDirectoryURL:[NSURL fileURLWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Desktop"]]];
    [savePanel setNameFieldStringValue:@"screenShot.png"];
    [savePanel beginSheetModalForWindow:self.window completionHandler:^(NSInteger result) {
        if (result == NSFileHandlingPanelOKButton)
        {
            [[[avatarView screenShot] TIFFRepresentation] writeToFile:[savePanel.URL path] atomically:YES];
        }
    }];
}

@end
