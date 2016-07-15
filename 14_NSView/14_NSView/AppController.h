//
//  AppController.h
//  14_NSView
//
//  Created by 郭韬 on 15/11/2.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>
@class StretchView;
@interface AppController : NSObject{
    IBOutlet StretchView *strethView;
}
- (IBAction)showOpenPanel:(id)sender;

@end
