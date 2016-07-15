//
//  NSAttributedString+Hyerlink.h
//  NSTextField
//
//  Created by 郭韬 on 15/12/7.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@interface NSAttributedString (Hyerlink)

+ (id)hyperlinkFromString:(NSString *)instring withURL:(NSURL *)aURL;
@end
