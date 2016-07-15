//
//  MyWindowController.m
//  Mac_ViewController
//
//  Created by 郭韬 on 15/11/5.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyWindowController.h"
#import "CustomImageVIewController.h"
#import "CustomVideoViewController.h"
#import "CustomTableViewController.h"
@interface MyWindowController ()

@end
@implementation MyWindowController
//定义一个选择按钮的枚举
enum
{
    KImageView = 1,
    KVideoView = 2,
    KTableView = 3
};
NSString *const KImageViewTitle = @"CustomImageView";
NSString *const KVideoViewTitle = @"CustomVideoView";
NSString *const KTableViewTitle = @"CustomTableView";
- (void)loadView{
    
    if (self.customImageVC == nil) {
        _customImageVC = [[CustomImageVIewController alloc] initWithNibName:KImageViewTitle bundle:nil];
    }
    //设置加载的视图
    [myView addSubview:[self.customImageVC view]];
    //加载的图片设置Frame值
    [[self.customImageVC view] setFrame:[myView bounds]];
}
- (void)awakeFromNib{
//[self loadView];
    //初始化时选择的视图
    [self changeViewController:KImageView];
}
//选择popup按钮
- (IBAction)selectedPopupAction:(id)sender{
   // NSLog(@"tag = %ld",[[sender selectedCell] tag]);
    [self changeViewController:[[sender selectedCell] tag]];
}
//选择item的下标
- (void)changeViewController:(NSUInteger)whichTag{
    //取出当前的myView的子视图
   // NSLog(@"NSArray = %@",[myView subviews]);
    if ([myView subviews]) {
        //取出当前视图的子视图，并且从当前父视图上移除
        NSView *view = [[myView subviews] lastObject];
        if ([view isEqualTo:self.customVideoVC.view]) {
            
            //移除通知
            [[NSNotificationCenter defaultCenter] removeObserver:self name:KVideoReadyNotification object:nil];
        }
        [view removeFromSuperview];
    }
    //判断选中的tag
    switch (whichTag)
    {
        case KImageView:
        {
            if (self.customImageVC == nil) {
                self.customImageVC = [[CustomImageVIewController alloc] initWithNibName:KImageViewTitle bundle:nil];
            }
            //添加视图
            [myView addSubview:self.customImageVC.view];
            //设置frame值
            [self.customImageVC.view setFrame:myView.bounds];
            break;
        case KVideoView:
            {
                if (self.customVideoVC == nil) {
                    
                    self.customVideoVC = [[CustomVideoViewController alloc] initWithNibName:KVideoViewTitle bundle:nil];
                }
                //接受视频准备好通知
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoReady:) name:KVideoReadyNotification object:nil];
                //检查video加载完成和正在准备
                if (self.customVideoVC.videoIsReady) {
                    [self.customVideoVC start:YES];
                }
                [myView addSubview:self.customVideoVC.view];
                [self.customVideoVC.view setFrame:myView.bounds];
                break;
            }
            case KTableView:
            {
                if (self.customTableVC == nil) {
                    
                    self.customTableVC = [[CustomTableViewController alloc] initWithNibName:KTableViewTitle bundle:nil];
                }
                [myView addSubview:self.customTableVC.view];
                [self.customTableVC.view setFrame:myView.bounds];
                    break;
                
            
        }
    }
    
}
}
- (void)videoReady:(NSNotification *)notification{
    //开始播放音频
    [self.customVideoVC start:YES];
}
- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
