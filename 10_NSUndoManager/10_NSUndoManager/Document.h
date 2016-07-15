//
//  Document.h
//  10_NSUndoManager
//
//  Created by 郭韬 on 15/10/29.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
/*
 undo管理器跟踪管理一个对象的添加,编辑和删除.这些消息将会发送给undo管理器去做undo.
 而当我们请求做undo操作时, undo管理器也会跟踪这些消息,这些消息会被记录用来做redo.
 该机制使用两个NSInvocation对像堆栈来实现.
 */
@interface Document : NSDocument{
    NSMutableArray *employees;
}
- (void)setEmployees:(NSMutableArray *)a;

@end

