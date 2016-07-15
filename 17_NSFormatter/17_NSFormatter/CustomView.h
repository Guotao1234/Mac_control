//
//  CustomView.h
//  17_NSFormatter
//
//  Created by 郭韬 on 15/11/4.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomView : NSView{
    
   // NSColor *_bgColor;
    IBOutlet NSColorWell *colorWell;
}
@property (nonatomic,strong)NSColor *bgColor;
- (IBAction)changeBackgroundColor:(id)sender;
@end
