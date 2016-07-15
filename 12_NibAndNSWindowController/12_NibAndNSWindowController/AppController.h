//
//  AppController.h
//  12_NibAndNSWindowController
//
//  Created by 郭韬 on 15/10/30.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
@class MyDocument;
@class PreferenceController;
@interface AppController : NSObject<NSApplicationDelegate>{
    PreferenceController *preferenceController;
    MyDocument *myDocument;
}
- (IBAction)showPreferencePanel:(id)sender;
@end
