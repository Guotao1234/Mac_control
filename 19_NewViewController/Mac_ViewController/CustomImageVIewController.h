//
//  CustomImageVIewController.h
//  Mac_ViewController
//
//  Created by 郭韬 on 15/11/5.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomImageVIewController : NSViewController{
    IBOutlet NSImageView *imageView;
    IBOutlet NSTextField *textView;
}
- (IBAction)openImageAction:(id)sender;

@end
