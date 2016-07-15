//
//  PreferenceController.h
//  Mac_NSWindowController
//
//  Created by 郭韬 on 15/10/27.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PreferenceController : NSWindowController{
    //IBOutlet是控件的引用，比如我想在程序中对控件进行操作
    IBOutlet NSColorWell *colorWell;
    IBOutlet NSButton *checkbox;
}
//IBAction是控件要执行的动作或事件
- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeNewEmptyDoc:(id)sender;
@end
