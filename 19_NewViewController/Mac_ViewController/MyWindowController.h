//
//  MyWindowController.h
//  Mac_ViewController
//
//  Created by 郭韬 on 15/11/5.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class CustomImageVIewController;
@class CustomVideoViewController;
@class CustomTableViewController;
@interface MyWindowController : NSWindowController{
    
    IBOutlet NSView *myView;
    IBOutlet NSPopUpButton *popUpButton;
}
@property (nonatomic,strong)CustomImageVIewController  *customImageVC;
@property (nonatomic,strong)CustomVideoViewController  *customVideoVC;
@property (nonatomic,strong)CustomTableViewController  *customTableVC;
- (IBAction)selectedPopupAction:(id)sender;
@end
