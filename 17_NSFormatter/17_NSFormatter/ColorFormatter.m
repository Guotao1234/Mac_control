//
//  ColorFormatter.m
//  17_NSFormatter
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "ColorFormatter.h"

@implementation ColorFormatter
- (instancetype)init{
    self = [super init];
    if (self) {
        
        colorList = [NSColorList colorListNamed:@"Apple"];
    }
    return  self;
}
- (NSString *)firstColorKeyForPartialString:(NSString *)string{
    //字符串长度是否为0
    if ([string length] == 0) {
        return  nil;
    }
    
    //在颜色列表内部循环
    for (NSString *key in [colorList allKeys]) {
        
        NSRange whereFound = [key rangeOfString:string
                                        options:NSCaseInsensitiveSearch ];
        //字符串与颜色开头是否匹配
        if ((whereFound.location == 0) && (whereFound.length > 0)) {
            return key;
        }
    }
    return nil;
}
- (NSString *)stringForObjectValue:(id)obj{
    return nil;
}
@end
