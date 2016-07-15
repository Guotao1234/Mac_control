//
//  MyDocument.h
//  9_NSArrayController
//
//  Created by 郭韬 on 15/10/28.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
/*
 MyDocument是NSDocument的子类.负责文件的读写.在这个练习中,
 我们会使用NSArrayController和绑定来构建我们的简单程序界面.所以,我们不会去给MyDocument添加任何代码.
 */
@interface MyDocument : NSDocument{
    
    NSMutableArray *employees;
}
- (void)setEmployees:(NSMutableArray *)a;
@end
