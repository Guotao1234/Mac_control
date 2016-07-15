//
//  AppDelegate.h
//  3_NSTextFiled
//
//  Created by 郭韬 on 15/10/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSOutlineViewDelegate,NSOutlineViewDataSource>

@property (nonatomic,strong)NSXMLDocument *xmldoc;
@end

