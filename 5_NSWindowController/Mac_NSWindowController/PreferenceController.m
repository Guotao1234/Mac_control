//
//  PreferenceController.m
//  Mac_NSWindowController
//
//  Created by 郭韬 on 15/10/27.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "PreferenceController.h"

@implementation PreferenceController
- (id)init{
    /*
     initWithWindowNibName 加载nib文件，加载完成后就会收到windowDidLoad消息
     */
    if (![super initWithWindowNibName:@"Preference"]) {
        
        return nil;
    }
    return self;
}
- (void)windowDidLoad{
    
    NSLog(@"Xib File is loaded");
}

- (IBAction)changeBackgroundColor:(id)sender{
    //选中颜色值的大小
    NSColor *color = [colorWell color];
    NSLog(@"Color changed:%@",color);
}
- (IBAction)changeNewEmptyDoc:(id)sender{
    //点击时候的状态
    NSInteger state = [checkbox state];
    NSLog(@"Checkbox changed %ld",state);
}
@end
