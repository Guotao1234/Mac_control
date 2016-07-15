//
//  NSTextView+Html.h
//  LinkTextView
//
//  Created by isee15 on 15/1/6.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSTextView (Html)

- (void)setHtmlForTextView:(NSString *)htmlString;

- (void)setReadOnly;
@end
