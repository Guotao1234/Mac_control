//
//  MainViewController.m
//  TextAttachmentDemo
//
//  Created by isee15 on 15/4/14.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "MainViewController.h"
#import "MyTextAttachmentCell.h"
@interface MainViewController ()<NSTextViewDelegate>
@property(unsafe_unretained) IBOutlet NSTextView *textView;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do view setup here.
    self.textView.string = @"text";
    self.textView.delegate = self;
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path = [resourcePath stringByAppendingPathComponent:@"shuai.gif"];
    
//     NSTextAttachment* attachment = [[NSTextAttachment alloc] init];
//    MyTextAttachmentCell *cell = [[MyTextAttachmentCell alloc] init];
//    cell.image = [NSImage imageNamed:@"in.gif"];
//    [cell setBordered:YES];
//    [cell setBezeled:YES];
//    [cell setSelectable:YES];
//    
//    cell.continuous = YES;
//    [attachment  setAttachmentCell:cell];
//     NSMutableAttributedString *attachmentString = (NSMutableAttributedString*)[NSMutableAttributedString attributedStringWithAttachment:attachment];
//    
//    [self.textView insertText:attachmentString];
    //    cell.imagePath = path;
    //
    //    [attachment setAttachmentCell:cell];
    
    NSFileWrapper *fileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[NSData dataWithContentsOfFile:path]];
    [fileWrapper setPreferredFilename:[path lastPathComponent]];

    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithFileWrapper:fileWrapper];
    NSAttributedString *fileAttString = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [self.textView insertText:fileAttString];
//
//    textAttachment = [[NSTextAttachment alloc] initWithFileWrapper:fileWrapper];
//    fileAttString = [NSAttributedString attributedStringWithAttachment:textAttachment];
//    [self.textView insertText:fileAttString];
//    [self.textView insertNewline:nil];
//    [self.textView deleteBackward:nil];
//    [self.textView scrollRangeToVisible:NSMakeRange(self.textView.string.length, 0)];
}
- (void)textView:(NSTextView *)textView doubleClickedOnCell:(id <NSTextAttachmentCell>)cell inRect:(NSRect)cellFrame atIndex:(NSUInteger)charIndex
{
    NSTextAttachmentCell *mentCell = (NSTextAttachmentCell *)cell;
    NSLog(@"cell = %@",[mentCell.image name]);
}
@end
