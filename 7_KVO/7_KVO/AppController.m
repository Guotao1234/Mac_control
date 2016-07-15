//
//  AppController.m
//  7_KVO
//
//  Created by 郭韬 on 15/10/28.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (instancetype)init{
   self = [super init];
    if (self) {
        
        [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];
        NSNumber *n = [self valueForKey:@"fido"];
        [slider setStringValue:[NSString stringWithFormat:@"%@",n]];
        textField.stringValue = @"121";
        //[textField setStringValue:@"dsdsd"];
       // NSLog(@"fido = %@",n);
    }
    return self;
}
//通过绑定Slider的Show bingdings inspector界面的Value值的绑定来，调用fido的set和get方法
//set 和 get 方法
- (int)fido{
    
    return fido;
}
- (void)setFido:(int)x{
    
    fido = x;
    NSLog(@"fido = %d",fido);
}
- (IBAction)incremenrFido:(id)sender{
    //给变量赋值，必须给这个key的观察者发送通知
    [self willChangeValueForKey:@"fido"];
    //fido++;
    [self setFido:[self fido]+1];
    [slider setStringValue:[NSString stringWithFormat:@"%d",fido]];
    [textField setStringValue:[NSString stringWithFormat:@"%d",fido]];
    //NSLog(@"fido is now %d",fido);
    [self didChangeValueForKey:@"fido"];
}
@end
