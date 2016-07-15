//
//  PreferenceController.h
//  12_NibAndNSWindowController
//
//  Created by 郭韬 on 15/10/30.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
extern NSString *const BNRTableBgColorKey;
extern NSString *const BNREmptyDocKey;
extern NSString *const BNRColorChangedNotification; 
@interface PreferenceController : NSWindowController{
    
    IBOutlet NSColorWell *colorWell;
    IBOutlet NSButton *checkbox;
}
- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeNewEmptyDoc:(id)sender;
- (NSColor *)tableBgColor;
- (BOOL)emptyDoc;
@end
