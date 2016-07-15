//
//  TutorController.m
//  16_NSTimer
//
//  Created by 郭韬 on 15/11/3.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "TutorController.h"
#import "BigLetterView.h"
@implementation TutorController

- (instancetype)init{
    
    self = [super init];
    if (self) {
        //创建字符队列
        letters = [NSArray arrayWithObjects:@"a",@"s",@"d",@"f",@"j",@"k",@"i",@";", nil];
        //创建随机数发生器
        srandom((unsigned)time(NULL));
        timeLimit = 60;
    }
    return self;
}
- (IBAction)stopGo:(id)sender{
    [self resetElapsedTime];
    
    if (timer == nil) {
        NSLog(@"Starting");
        //创建定时器
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                 target:self
                                               selector:@selector(checkThem:)
                                               userInfo:nil
                                                repeats:YES];
    }else{
        NSLog(@"Stopping");
        
        //设置定时器无效
        [timer invalidate];
        timer = nil;
    }
    
}
- (void)updateElapsedTime{
    [self willChangeValueForKey:@"elapsedTime"];
    elapsedTime = [NSDate timeIntervalSinceReferenceDate];
    //NSLog(@"date %f",elapsedTime);
    //获取系统当前时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"ss"];
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];
    self.timeCount = [dateTime intValue];
    [outLetterView setString:[letters objectAtIndex:self.timeCount %7]];
    //刷新一个UIView,调用它的setNeedsDisplay就可以了，则会自动触发drawRect:来实现界面的刷新
    [outLetterView setNeedsDisplay:YES];
   // NSLog(@"dateTime = %d",self.timeCount %7);
    [self didChangeValueForKey:@"elapsedTime"];
}
- (void)resetElapsedTime{
    startTime = [NSDate timeIntervalSinceReferenceDate];
    [self updateElapsedTime];
}
- (void)showAnotherLetter{
    
    //选择随机数，直到得到下一个不同的值
    int x = lastIndex;
    while (x == lastIndex) {
        x = (int)(random() % [letters count]);
    }
    lastIndex = x;
    [outLetterView setString:[letters objectAtIndex:x]];
    
    //再次计数
    [self resetElapsedTime];
    
}
- (void)awakeFromNib{
    
    [self showAnotherLetter];
}
#pragma mark - NSTimer Selector
- (void)checkThem:(NSTimer *)timer{
    //NSLog(@"hjk");
    if ([[inLetterView string] isEqual:[outLetterView string]]) {
        
        [self showAnotherLetter];
    }
    [self updateElapsedTime];
    if (self.timeCount >= timeLimit) {
        NSBeep();
        [self resetElapsedTime];
    }
}
#pragma mark - 模态弹出sheetwindow
- (IBAction)showSpeedSheet:(id)sender{
    //模态弹出窗口
    [mainWindow beginSheet:speedSheet completionHandler:^(NSModalResponse returnCode) {
        //结束窗口时的回调
        if (returnCode == NSModalResponseStop) {
             NSLog(@"模态弹出的窗口已经结束");
        }
    }];
}
//模态结束弹出的窗口
- (IBAction)endSpeedSheet:(id)sender{
    
    //[mainWindow endSheet:speedSheet];
    [mainWindow endSheet:speedSheet returnCode:NSModalResponseStop];
}
@end
