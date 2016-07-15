//
//  Person.h
//  10_NSUndoManager
//
//  Created by 郭韬 on 15/10/29.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *personName;
    float expectedRaise;
}
@property (readwrite,copy)NSString *personName;
@property (readwrite)float expectedRaise;

@end
