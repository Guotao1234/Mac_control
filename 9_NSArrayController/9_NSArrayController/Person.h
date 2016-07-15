//
//  Person.h
//  9_NSArrayController
//
//  Created by 郭韬 on 15/10/28.
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
