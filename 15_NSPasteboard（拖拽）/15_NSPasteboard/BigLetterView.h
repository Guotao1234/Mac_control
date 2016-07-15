//
//  BigLetterView.h
//  15_NSPasteboard
//
//  Created by 郭韬 on 15/11/3.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BigLetterView : NSView<NSDraggingDestination>

@property (nonatomic,copy)NSString *string;
@property (nonatomic,strong)NSColor* bgColor;
@property (nonatomic,strong)NSTextField *textField;
@property (nonatomic,copy)NSString *textStr;
- (IBAction)cut:(id)sender;
- (IBAction)copy:(id)sender;
- (IBAction)paste:(id)sender;
@end
