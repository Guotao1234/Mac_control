//
//  BigLetterView.h
//  16_NSTimer
//
//  Created by 郭韬 on 15/11/3.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BigLetterView : NSView{
    NSColor *_bgColor;
    NSString *_string;
    NSMutableDictionary *_attributes;
}
@property (nonatomic,strong)NSColor *bgColor;
@property (nonatomic,copy)NSString *string;
- (void)prepareAttributes;
@end
