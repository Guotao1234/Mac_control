//
//  CustomVideoViewController.m
//  Mac_ViewController
//
//  Created by 郭韬 on 15/11/5.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomVideoViewController.h"

NSString *KVideoReadyNotification = @"videoReadyNotification";
@interface CustomVideoViewController ()

@end

@implementation CustomVideoViewController
- (void)awakeFromNib{
    
    NSString *moviePathStr = [[NSBundle mainBundle] pathForResource:@"adam" ofType:@"mov"];
    player = [[AVPlayer alloc] init];
    //设置播放路径
    AVURLAsset *file = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:moviePathStr isDirectory:NO]];
    //在其它线程上加载文件
    [file loadValuesAsynchronouslyForKeys:nil completionHandler:^{
        
        //回到异步加载回到主线程加载
        dispatch_async(dispatch_get_main_queue(), ^{
            
           //创建视频播放的图层
            AVPlayerLayer *newPlayerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
            //设置图层的frame值
            //要想self.view.layer有效就必须在图形界面的Effects inspector界面勾选core Animation Layer勾上
            [newPlayerLayer setFrame:[[self.view layer]bounds]];
            //NSLog(@"newP = %@",NSStringFromRect(self.view.layer.bounds));
            //设置图层的宽和高是可变的
            [newPlayerLayer setAutoresizingMask:kCALayerHeightSizable | kCALayerWidthSizable];
            //添加到当前视图的图层上
            [self.view.layer addSublayer:newPlayerLayer];
            
            //创建一个播放项
            AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:file];
            //设置为当前的播放项
            [player replaceCurrentItemWithPlayerItem:playerItem];
            
            _videoIsReady = YES;
            //发送播放准备好的通知
            [[NSNotificationCenter defaultCenter] postNotificationName:KVideoReadyNotification object:nil];
            //返回播放
            _playForward = YES;
            //对AVPlayerItemDidPlayToEndTimeNotification（完成播放）增加一个通知
            [[NSNotificationCenter defaultCenter]
             addObserverForName:AVPlayerItemDidPlayToEndTimeNotification
             object:playerItem
             queue:nil
             usingBlock:^(NSNotification * _Nonnull note) {
                
                 if(self.playForward)
                 {
                     //移动播放光标到给定的时间
                     [player seekToTime:CMTimeMultiplyByFloat64(playerItem.duration, 0.99)];
                     [player play];
                      player.rate = -1;
                     _playForward = NO;
                 }
                 else
                 {
                     [player seekToTime:kCMTimeZero];
                     [player play];
                     player.rate = 1;
                     _playForward = YES;
                 }
            }];
        });
    }];
}
- (void)start:(BOOL)start{
    if (start) {
        //播放音频
        [player play];
    }
    else {
        //暂停音频
        [player pause];
    }
}
//移除观察者
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
