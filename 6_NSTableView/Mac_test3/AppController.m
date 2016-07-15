//
//  AppController.m
//  Mac_test3
//
//  Created by 郭韬 on 15/10/27.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppController.h"

@implementation AppController
//当xib文件加载时就初始化对象
- (instancetype)init{
    
    self = [super init];
    //初始化发音对象
    speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
    speechSynth.delegate = self;
    voiceList = [NSSpeechSynthesizer availableVoices];
    return self;
}
- (IBAction)sayIt:(id)sender{
    
    NSString *string = [textField stringValue];
    if ([string length] == 0) {
        NSLog(@"string from %@ is of zero-length",textField );
        return;
    }
    NSLog(@"text = %@",textField);
    //设置开始时候的按钮的状态
    [stopButton setEnabled:YES];
    [startButton setEnabled:NO];
    [tableView setEnabled:NO];
    //开始发音的按钮
    [speechSynth startSpeakingString:string];
    NSLog(@"Have started to say :%@",string);
}
- (IBAction)stopIt:(id)sender{
    
    NSLog(@"stopping");
    //停止发音的按钮,也实现了代理方法finishedSpeaking
    [speechSynth stopSpeaking];
}
#pragma mark - NSSpeechSynthesizerDelegate
- (void)speechSynthesizer:(NSSpeechSynthesizer *)sender didFinishSpeaking:(BOOL)finishedSpeaking{
    
    NSLog(@"已经完成了发音");
    [startButton setEnabled:YES];
    [stopButton setEnabled:NO];
    [tableView setEnabled:YES];
}
#pragma mark - NSTableViewDataSource
//反馈有多少行数据要显示
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
    return [voiceList count];
}
//每列中每行要显示什么的数据,//注意应该把Content Mode 由View Based 改为 Cell Based 就可以了
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    //声音的标识是一个长字符串.例如:com.apple.speech.synthesis.voice.Fred.如果你想让table view中只显示Fred.
    NSString *v = [voiceList objectAtIndex:row];
    //根据声音的属性，取出所含声音信息的字典
    NSDictionary *dic = [NSSpeechSynthesizer attributesForVoice:v];
    //取出声音的名字
    NSLog(@"voic = %@",[dic objectForKey:NSVoiceName]);
    return [dic objectForKey:NSVoiceName];
}
#pragma mark - NSTableViewDelegate
//当选中TableViewcell时候该方法会被调用
- (void)tableViewSelectionDidChange:(NSNotification *)notification{
    
    NSUInteger row = [tableView selectedRow];
    if (row == -1) {
        return ;
    }
    NSString *selectedVoice = [voiceList objectAtIndex:row];
    //改变刚发出的声音
    [speechSynth setVoice:selectedVoice];
    NSLog(@"new voice = %@",selectedVoice);
}
- (void)awakeFromNib{
    
    NSString *defaultVoice = [NSSpeechSynthesizer defaultVoice];
    NSUInteger defaultRow = [voiceList indexOfObject:defaultVoice];
    NSLog(@"defaultRow = %ld",defaultRow);
    [tableView scrollRowToVisible:defaultRow];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:defaultRow];
    //taleView选择cell时的状态
    [tableView selectRowIndexes:indexSet byExtendingSelection:NO];
}

#pragma mark - NSButton
- (void)buttonAction{
    
    NSButton *button = [[NSButton alloc] init];
    SEL mySelector;
    //根据一个字符串生产一个方法
    mySelector = NSSelectorFromString(@"drawMickey:");
    //[button setTarget:someObjectWithADrawMickeyMethod];
}
- (void)drawMickey:(id)sender{
    
}
@end
