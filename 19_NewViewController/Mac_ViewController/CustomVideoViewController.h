//
//  CustomVideoViewController.h
//  Mac_ViewController
//
//  Created by 郭韬 on 15/11/5.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AVFoundation/AVFoundation.h>
//定义一个外部调用的通知
extern NSString *KVideoReadyNotification;
@interface CustomVideoViewController : NSViewController{
    
    AVPlayer *player;
}
@property (readonly)BOOL videoIsReady;
@property (readonly)BOOL playForward;
- (void)start:(BOOL)start;
@end
