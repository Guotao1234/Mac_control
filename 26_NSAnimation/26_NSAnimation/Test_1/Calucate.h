//
//  Calucate.h
//  Test_1
//
//  Created by 郭韬 on 15/11/18.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@interface Calucate : NSObject<NSAnimationDelegate>
{
    
    IBOutlet NSImageView  *_imageView;
    CGRect  rect;
}

@property (strong)IBOutlet NSTextField *textField;

- (IBAction)addAction:(id)sender;
- (IBAction)deleteAction:(id)sender;

@end
