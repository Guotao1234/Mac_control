//
//  TutorController.h
//  16_NSTimer
//
//  Created by 郭韬 on 15/11/3.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@class BigLetterView;
@interface TutorController : NSObject{
    
    IBOutlet BigLetterView *inLetterView;
    IBOutlet BigLetterView *outLetterView;
    IBOutlet NSWindow *speedSheet;
    IBOutlet NSWindow *mainWindow;
    //Data
    NSArray *letters;
    int lastIndex;
    
    //Time
    //int timeCount;
    NSTimeInterval startTime;
    NSTimeInterval elapsedTime;
    int timeLimit;
    NSTimer *timer;
}
@property (nonatomic,assign)int timeCount;
- (IBAction)stopGo:(id)sender;
- (void)updateElapsedTime;
- (void)resetElapsedTime;
- (void)showAnotherLetter;

- (IBAction)showSpeedSheet:(id)sender;
- (IBAction)endSpeedSheet:(id)sender;
@end
