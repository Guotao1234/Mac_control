//
//  MainViewController.m
//  TextAttachmentDemo
//
//  Created by isee15 on 15/4/14.
//  Copyright (c) 2015年 isee15. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<NSTextViewDelegate>
{
   IBOutlet NSScrollView* scroll;
    NSTextView *testView;
}
@property(unsafe_unretained) IBOutlet NSTextView *textView;


@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.textView setSelectable:NO];
    // Do view setup here.
   // [self.textView setEditable:NO];
 
    
    self.textView.string = @"text\n";
   [self.textView setEditable:NO];
    self.textView.delegate = self;
    
    NSImage *image =[NSImage imageNamed:@"加载图片"];
   // image.size = NSMakeSize(20, 20);
    NSTextAttachmentCell *cell = [[NSTextAttachmentCell alloc] initImageCell:image];
    //NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path = [resourcePath stringByAppendingPathComponent:@"加载图片.png"];
    NSFileWrapper *fileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[NSData dataWithContentsOfFile:path]];
    [fileWrapper setPreferredFilename:[path lastPathComponent]];
    [fileWrapper setFilename:path];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithFileWrapper:fileWrapper];
    
    //    HMEmotionAttachment *attachment = [[HMEmotionAttachment alloc]init];
    //    attachment.emotion = emotion;
    //
    [textAttachment setAttachmentCell: cell];
    NSAttributedString *attributedString = [NSAttributedString  attributedStringWithAttachment: textAttachment];
     [[self.textView textStorage] insertAttributedString:attributedString atIndex: self.textView.attributedString.length];
    //[self.textView insertText:attributedString];
    
  //  [self.textView insertNewline:<#(nullable id)#>]
    //[self.textView insertTab:nil];
    NSRange range1 = [[self.textView layoutManager] glyphRangeForTextContainer:self.textView.textContainer];
    
  //  //Finally get the height
   float textViewHeight1 = [[self.textView layoutManager] boundingRectForGlyphRange:range1
                                                                    inTextContainer:self.textView.textContainer].size.height;
    // NSLog(@"%f",textViewHeight1);
     NSAttributedString *attributedString3 = [[NSAttributedString  alloc] initWithString:@"\n"];
     [[self.textView textStorage] insertAttributedString:attributedString3 atIndex: self.textView.attributedString.length];
    
    NSTextAttachmentCell *cell1 = [[NSTextAttachmentCell alloc] initImageCell:[NSImage imageNamed:@"cai"]];
    //NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    NSString *resourcePath1 = [[NSBundle mainBundle] resourcePath];
    NSString *path1 = [resourcePath1 stringByAppendingPathComponent:@"cai.png"];
    NSFileWrapper *fileWrapper1 = [[NSFileWrapper alloc] initRegularFileWithContents:[NSData dataWithContentsOfFile:path1]];
    [fileWrapper1 setPreferredFilename:[path1 lastPathComponent]];
    [fileWrapper1 setFilename:path1];
    NSTextAttachment *textAttachment1 = [[NSTextAttachment alloc] initWithFileWrapper:fileWrapper1];
    
    //    HMEmotionAttachment *attachment = [[HMEmotionAttachment alloc]init];
    //    attachment.emotion = emotion;
    //
    [textAttachment1 setAttachmentCell: cell1];
    NSAttributedString *attributedString1 = [NSAttributedString  attributedStringWithAttachment: textAttachment1];
    //[self.textView insertNewline:attributedString1];
     [[self.textView textStorage] insertAttributedString:attributedString1 atIndex: self.textView.attributedString.length];
    
    NSRange range = [[self.textView layoutManager] glyphRangeForTextContainer:self.textView.textContainer];
    
    //Finally get the height
    float textViewHeight = [[self.textView layoutManager] boundingRectForGlyphRange:range
                                                                 inTextContainer:self.textView.textContainer].size.height;
//    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
//    NSString *path = [resourcePath stringByAppendingPathComponent:@"in.gif"];
//    NSFileWrapper *fileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[NSData dataWithContentsOfFile:path]];
//    [fileWrapper setPreferredFilename:[path lastPathComponent]];
//
//    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] initWithFileWrapper:fileWrapper];
//    NSAttributedString *fileAttString = [NSAttributedString attributedStringWithAttachment:textAttachment];
//    [self.textView insertText:fileAttString];
//
//    textAttachment = [[NSTextAttachment alloc] initWithFileWrapper:fileWrapper];
//    fileAttString = [NSAttributedString attributedStringWithAttachment:textAttachment];
//    [self.textView insertText:fileAttString];
//    [self.textView insertNewline:nil];
//    [self.textView deleteBackward:nil];
//    [self.textView scrollRangeToVisible:NSMakeRange(self.textView.string.length, 0)];
    //[self.textView setSelectedRange:NSMakeRange(self.textView.textStorage.string.length, 0)];
}
- (void)textView:(NSTextView *)textView clickedOnCell:(id <NSTextAttachmentCell>)cell inRect:(NSRect)cellFrame atIndex:(NSUInteger)charIndex
{
    NSTextAttachment *attachment = cell.attachment;
     [[NSWorkspace sharedWorkspace] openFile:attachment.fileWrapper.filename];
    NSLog(@"cell = %@",attachment.fileWrapper.filename);
    //NSTextAttachmentCell *cell1 = cell;
}
@end
