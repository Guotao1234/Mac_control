//
//  AppDelegate.m
//  UrlTextView
//
//  Created by Xu Lian on 2013-07-19.
//  Copyright (c) 2013 Beyondcow. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    NSError *error = NULL;
    //NSDataDetector 匹配数据的类为URL链接
    dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];
    if (error) {
        dataDetector=nil;
    }
    [_textView setString:@"Welcome to http://maccocoa.com\nFounded by Beyondcow.com"];
    //发送已经改变的通知
    [_textView didChangeText];
}

-(void)textDidChange:(NSNotification *)notification {
    if (notification.object==_textView) {
        if (dataDetector) {
            //取出当前_textView.textStorage的数据
            NSString *string = [_textView.textStorage string];
            NSLog(@"textString ＝ %@",string);
            //配置字符串的结果
            NSArray *matches = [dataDetector matchesInString:string options:0 range:NSMakeRange(0, [string length])];
            //开始改变数据的属性和特征
            [_textView.textStorage beginEditing];
            //移除字体的所有属性
            [_textView.textStorage removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, [string length])];
            [_textView.textStorage removeAttribute:NSLinkAttributeName range:NSMakeRange(0, [string length])];
            for (NSTextCheckingResult *match in matches) {
                NSRange matchRange = [match range];
                if ([match resultType] == NSTextCheckingTypeLink) {
                    //取出匹配的URL
                    NSURL *url = [match URL];
                    //为匹配的URL的string添加属性
                    [_textView.textStorage addAttributes:@{NSLinkAttributeName:url.absoluteString} range:matchRange];
                }
            }
            //保存数据的属性和特征
            [_textView.textStorage endEditing];
        }
    }
}

@end
