//
//  AppController.h
//  7_KVO
//
//  Created by 郭韬 on 15/10/28.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface AppController : NSObject{
    int fido;
    IBOutlet NSSlider *slider;
    IBOutlet NSTextField *textField;
}
- (int)fido;
- (void)setFido:(int)x;
- (IBAction)incremenrFido:(id)sender;
//@property (nonatomic,assign)int fido;
@end
