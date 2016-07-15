//
//  NSAttributedString+Hyerlink.m
//  NSTextField
//
//  Created by 郭韬 on 15/12/7.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "NSAttributedString+Hyerlink.h"

@implementation NSAttributedString (Hyerlink)

+ (id)hyperlinkFromString:(NSString *)instring withURL:(NSURL *)aURL{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:instring];
    
    NSRange range = NSMakeRange(0, [instring length]);
    [attrString endEditing];
    [attrString addAttribute:NSLinkAttributeName value:[aURL absoluteURL] range:range];
    [attrString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:range];
    [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:NSUnderlineStyleSingle] range:range];
    
    [attrString endEditing];
    
    return attrString;
}
@end
