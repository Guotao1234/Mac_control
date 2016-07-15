//
//  AppController.m
//  14_NSView
//
//  Created by 郭韬 on 15/11/2.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppController.h"
#import "StretchView.h"

@implementation AppController
- (void)openPanelDidEnd:(NSOpenPanel *)openPanel
             returnCode:(int)returnCode
            contextInfo:(void *)contextInfo{
    if (returnCode == NSOKButton) {
        
        NSString *path = [openPanel filename];
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:path];
        [strethView setImage:image];
        
    }
}
- (IBAction)showOpenPanel:(id)sender
{
    
    NSOpenPanel *panpel = [NSOpenPanel openPanel];
    
    [panpel beginSheetModalForWindow:[strethView window] completionHandler:^(NSInteger result) {
        
    }];
}
@end
