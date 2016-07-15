//
//  ViewController.m
//  LinkTextView
//
//  Created by isee15 on 15/1/6.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "ViewController.h"
#import "NSTextView+Html.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    [self.linkTextView setReadOnly];
    [self.linkTextView setHtmlForTextView:@"故国三千里，<a href=\"一花一世界\">深宫二十年。</a>一声何满子，<a href=\"abc://www.sina.com.cn\">双泪落君前。</a>"];
    self.linkTextView.delegate = self;
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (BOOL)textView:(NSTextView *)aTextView clickedOnLink:(id)aLink
         atIndex:(NSUInteger)charIndex
{
    if ([aLink length] > 0) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert addButtonWithTitle:@"OK"];
        [alert setMessageText:@"Link"];
        [alert setInformativeText:[NSString stringWithFormat:@"you clicked link: %@", aLink]];
        [alert setAlertStyle:NSWarningAlertStyle];
        [alert beginSheetModalForWindow:[self.view window] completionHandler:nil];
        return YES;
    }
    return NO; // let AppKit take care of the link
}

@end
