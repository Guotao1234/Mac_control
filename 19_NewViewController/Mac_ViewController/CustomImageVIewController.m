//
//  CustomImageVIewController.m
//  Mac_ViewController
//
//  Created by 郭韬 on 15/11/5.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomImageVIewController.h"

@interface CustomImageVIewController ()

@end

@implementation CustomImageVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (void)awakeFromNib{
    //加载图片路径
    NSString *imagePathStr = [[NSBundle mainBundle] pathForResource:@"LakeDonPedro" ofType:@"jpg"];
    //配置图片
    [self configureImage:imagePathStr];
}
//配置图片
- (void)configureImage:(NSString *)imagePathStr{
    NSImage *image = [[NSImage alloc] initWithContentsOfFile:imagePathStr];
    [imageView setImage:image];
    //[imagePathStr lastPathComponent]最后路径的值
    [textView setStringValue:[imagePathStr lastPathComponent]];
}
//打开一个图片
- (IBAction)openImageAction:(id)sender{
    //设置打开文件对话框的对象
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    //设置打开文件的类型
    NSArray *fileTypes = [NSArray arrayWithObjects:@"jpg", @"gif", @"png", @"tiff", nil];
    //设置不允许打开多个文件
    [openPanel setAllowsMultipleSelection:NO];
    //设置提示信息
    [openPanel setMessage:@"Choose an image"];
    //设置文件打开类型
    [openPanel setAllowedFileTypes:fileTypes];
    //设置打开文件的路径
    [openPanel setDirectoryURL:[NSURL fileURLWithPath:@"/Library/Desktop Pictures/"]];
    //设置模态弹出
    [openPanel beginSheetModalForWindow:self.view.window completionHandler:^(NSInteger result) {
        
        NSLog(@"result = %ld",result);
        /*
         NSModalResponseOK = 1,         点击open时返回1
         NSModalResponseCancel	= 0     （ESC退出）点击cancel时返回0
         */
        //回调
        if (result == NSModalResponseOK) {
            if ([[openPanel URL] isFileURL]) {
                //设置图片
                [self configureImage:[[openPanel URL] path]];
            }
        }
    }];
    
}
@end
