//
//  AppController.h
//  Mac_test3
//
//  Created by 郭韬 on 15/10/27.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface AppController : NSObject<NSSpeechSynthesizerDelegate,NSTableViewDataSource,NSTableViewDelegate>{
    
    IBOutlet NSTextField *textField;
    IBOutlet NSButton *stopButton;
    IBOutlet NSButton *startButton;
    
    IBOutlet NSTableView *tableView;
    //NSSpeechSynthesizer 发音合成器
    NSSpeechSynthesizer *speechSynth;
    //声音列表
    NSArray *voiceList;
}
- (IBAction)sayIt:(id)sender;
- (IBAction)stopIt:(id)sender;

@end
