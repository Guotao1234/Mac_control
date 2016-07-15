//
//  ColorFormatter.h
//  17_NSFormatter
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@interface ColorFormatter : NSFormatter{
    NSColorList *colorList;
}
- (NSString *)firstColorKeyForPartialString:(NSString *)string;
@end
