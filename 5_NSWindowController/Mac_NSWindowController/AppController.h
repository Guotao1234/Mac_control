//
//  AppController.h
//  Mac_NSWindowController
//
//  Created by 郭韬 on 15/10/27.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PreferenceController;
@interface AppController : NSObject{
    
    PreferenceController *preferceController;
}

- (IBAction)showPerferencePanpel:(id)sender;

@end
