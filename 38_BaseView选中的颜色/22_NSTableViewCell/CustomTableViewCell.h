//
//  CustomTableViewCell.h
//  22_NSTableViewCell
//
//  Created by 郭韬 on 15/11/26.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomTableViewCell : NSTableCellView
@property (weak,nonatomic) IBOutlet NSImageView *myCustomView;
@property (weak,nonatomic) IBOutlet NSTextField *myTextField;
@end
