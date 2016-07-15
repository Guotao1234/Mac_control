//
//  AppDelegate.m
//  NSTextView
//
//  Created by 郭韬 on 15/11/20.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppDelegate.h"
#define textViewDraggedTypes @"MyTextViewDraggedType"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    /*
     APPKIT_EXTERN NSString * NSTextViewWillChangeNotifyingTextViewNotification;
     
     // NSOldSelectedCharacterRange -> NSValue with old range.
     APPKIT_EXTERN NSString * NSTextViewDidChangeSelectionNotification;
     
     APPKIT_EXTERN NSString * NSTextViewDidChangeTypingAttributesNotification;
     */
    /*
    APPKIT_EXTERN NSString * NSTextDidBeginEditingNotification;
    APPKIT_EXTERN NSString * NSTextDidEndEditingNotification;    // userInfo key:  @"NSTextMovement"
    APPKIT_EXTERN NSString * NSTextDidChangeNotification;
    */
    //为textView注册拖拽类型
    //[textView registerForDraggedTypes:[NSArray arrayWithObject:textViewDraggedTypes]];
   // NSArray *array =  [textView writablePasteboardTypes];
  //  NSLog(@"array = %@",array);
   // textView.delegate = self;
    //设置TextView改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewWillChanged:) name:NSTextDidChangeNotification object:textView];
}

- (void)textViewWillChanged:(NSNotification *)notification
{
    /*
    NSLog(@"ischange = %hhd",self.isChanged);
    if (!self.isChanged) {
        self.isChanged = YES;
        NSTextView *myTextView = notification.object;
        NSString *imageStr = [myTextView string];
        NSLog(@"string = %@",imageStr);
        
        NSString *str = [[NSBundle mainBundle] pathForResource:@"in" ofType:@"gif"];
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:str];
        NSFileWrapper *imageFileWrapper = [[NSFileWrapper alloc] initRegularFileWithContents:[image TIFFRepresentation]] ;
        imageFileWrapper.filename = [imageStr lastPathComponent];
        imageFileWrapper.preferredFilename = [imageStr lastPathComponent];
        
        NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] initWithFileWrapper:imageFileWrapper] ;
        NSAttributedString *imageAttributedString = [NSAttributedString attributedStringWithAttachment:imageAttachment];
        // [myTextView scrollRangeToVisible:NSMakeRange(myTextView.string.length, 0)];
        // [myTextView addSubview:imageView];
        //把NSTextView的光标移动到文件末尾
        //[myTextView setSelectedRange:NSMakeRange(textView.textStorage.string.length, 0)];
        // [myTextView insertText:@" Hello"];
        // NSLog(@"obj =  %@",[myTextView string]);
        //不断插入，不断循环
        [textView insertText:imageAttributedString];
        [textView deleteBackward:nil];

        [textView updateDragTypeRegistration];
        [textView scrollRangeToVisible:NSMakeRange(textView.string.length, 0)];
    }
     */
    //移动光标到文件末尾
    [textView scrollRangeToVisible:NSMakeRange(textView.string.length, 0)];
   }

@end
