//
//  NSTextView+Html.m
//  LinkTextView
//
//  Created by isee15 on 15/1/6.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "NSTextView+Html.h"

@implementation NSTextView (Html)
- (void)setHtmlForTextView:(NSString *)htmlString
{
    if (htmlString.length == 0) {
        self.string = @"";
        return;
    }
    [self setLinkTextAttributes:@{NSCursorAttributeName : [NSCursor pointingHandCursor]}];

    NSRegularExpression *exp = [NSRegularExpression regularExpressionWithPattern:@"<a href=\"([^\"]+)\">([^<]+)</a>" options:NSRegularExpressionDotMatchesLineSeparators error:nil];
    NSArray *matches = [exp matchesInString:htmlString options:0 range:NSMakeRange(0, [htmlString length])];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:htmlString];
    int offset = 0;
    for (NSTextCheckingResult *match in matches) {
        NSUInteger count = [match numberOfRanges];
        if (count == 3) {
            NSRange urlRange = [match rangeAtIndex:1];
            NSString *urlStr = [htmlString substringWithRange:urlRange];
            NSRange textRange = [match rangeAtIndex:2];
            NSString *textStr = [htmlString substringWithRange:textRange];
            textStr = [self stringByDecodeHtml:textStr];
            NSRange fullRange = [match rangeAtIndex:0];
            fullRange.location = fullRange.location + offset;
            NSAttributedString *urlAttr = [[NSAttributedString alloc] initWithString:textStr attributes:@{NSLinkAttributeName : urlStr, NSForegroundColorAttributeName : [NSColor colorWithRed:0x37 / 255.0f green:0x8a / 255.0f blue:0xf2 / 255.0f alpha:1], NSToolTipAttributeName : textStr}];
            [attrStr replaceCharactersInRange:fullRange withAttributedString:urlAttr];
            offset = offset + (int) textStr.length - (int) fullRange.length;
        }
    }

    [self.textStorage beginEditing];
    [self.textStorage setAttributedString:attrStr];
    [self.textStorage endEditing];

}

- (NSString *)stringByDecodeHtml:(NSString *)str
{
    if (str.length == 0) return @"";
    NSMutableString *result = [NSMutableString stringWithString:str];
    [result replaceOccurrencesOfString:@"&apos;" withString:@"'" options:NSLiteralSearch range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"&quot;" withString:@"\"" options:NSLiteralSearch range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"&lt;" withString:@"<" options:NSLiteralSearch range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"&gt;" withString:@">" options:NSLiteralSearch range:NSMakeRange(0, result.length)];
    [result replaceOccurrencesOfString:@"&amp;" withString:@"&" options:NSLiteralSearch range:NSMakeRange(0, result.length)];
    return [result copy];
}

- (void)setReadOnly
{
    self.editable = NO;
    self.drawsBackground = NO;
    [[self enclosingScrollView] setDrawsBackground:NO];
    [[self enclosingScrollView] setBorderType:NSNoBorder];
    [[self enclosingScrollView] setAutohidesScrollers:YES];
}

@end
