//
//  AppController.m
//  Mac_NSWindowController
//
//  Created by 郭韬 on 15/10/27.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"
@implementation AppController
- (IBAction)showPerferencePanpel:(id)sender{
    
    if (preferceController == nil) {
        
        preferceController = [[PreferenceController alloc] init];
        
    }
    [preferceController showWindow:self];

}
@end
