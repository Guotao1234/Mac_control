//
//  AppDelegate.m
//  NSTextField
//
//  Created by 郭韬 on 15/12/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#import "NSAttributedString+Hyerlink.h"
#import "NSDate+Components.h"
@interface AppDelegate ()
{
    NSDataDetector *dataDetector;
    NSAttributedString *attributedString ;
}

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *linkText;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSError *error = NULL;
    //NSDataDetector 匹配数据的类为URL链接
    dataDetector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingTypeLink error:&error];
    if (error) {
        dataDetector=nil;
    }
    [self.textField setAllowsEditingTextAttributes:YES];
    [self.textField setSelectable:YES];
    [self setTextFieldAttributeValue];
    
    [self.linkText setStringValue:@"云屋"];
    [self setHyperlinkWithTextField:self.linkText];
    
    NSDate  *date = [[NSDate alloc] init];
    NSString *string = [date yearString];
    NSLog(@"date = %@",string);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (void)setHyperlinkWithTextField:(NSTextField *)textField{
    
    [textField setAllowsEditingTextAttributes:YES];
    [textField setSelectable:YES];
    
    NSURL *url = [NSURL URLWithString:@"http://www.cloudroom.net"];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
    [string appendAttributedString:[NSAttributedString hyperlinkFromString:textField.stringValue withURL:url ]];
    [string addAttribute:NSFontAttributeName value:[NSFont systemFontOfSize:18] range:NSMakeRange(0, [[textField stringValue] length])];
    [textField setAttributedStringValue:string];
}
- (void)setTextFieldAttributeValue{
   
    NSMutableAttributedString *mustableString = [[NSMutableAttributedString alloc] initWithString:self.textField.stringValue];
    //匹配字符串返回的数组
    NSArray *matches = [dataDetector matchesInString:self.textField.stringValue options:0 range:NSMakeRange(0, [[self.textField stringValue] length])];
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match range];
        if ([match resultType] == NSTextCheckingTypeLink) {
            [mustableString beginEditing];
            //取出匹配的URL
            NSURL *url = [match URL];
            NSLog(@"url = %@",url);
            NSLog(@"url = %@",NSStringFromRange(matchRange));
            
            [mustableString addAttribute:NSLinkAttributeName value:url.absoluteString  range:matchRange];
            [mustableString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:matchRange];
            [mustableString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:matchRange];
            [mustableString addAttribute:NSFontAttributeName value:[NSFont systemFontOfSize:19] range:NSMakeRange(0, [[self.textField stringValue] length])];
            [mustableString endEditing];
           // NSLog(@"string = %@",string);
           
        }
    }
     [self.textField setAttributedStringValue:mustableString];
}
@end
