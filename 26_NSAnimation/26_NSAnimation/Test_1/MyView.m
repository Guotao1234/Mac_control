//
//  MyView.m
//  Test_1
//
//  Created by 郭韬 on 15/11/18.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyView.h"
#import <QuartzCore/QuartzCore.h>
@implementation MyView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
+ (id)defaultAnimationForKey:(NSString *)key {
    if ([key isEqualToString:@"transform.scale"]) {
        // By default, animate border color changes with simple linear interpolation to the new color value.
        CABasicAnimation *animation =
        [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        
        //设置动画的前后值
        animation.fromValue = @1; // fromValue 必须为一个对象
        animation.toValue = @3;
        
        //指定动画的时间，默认时间和隐式动画相同，0.25秒
        [animation setDuration:5];
        
        //重复的时间长度（设置为7.5 效果和重复次数设置为1.5一样）
        //[animation setRepeatDuration:7.5];
        
        //设置动画延迟执行的时间
        animation.beginTime = CACurrentMediaTime() + 3; //从当前的时间延迟3秒执行
        
        //设置自动回放(使用了之前的动画相关的属性)
        //[animation setAutoreverses:YES];
        
        //动画结束的时候是否把layer的变化保留
        [animation setRemovedOnCompletion:NO];
        
        //上面这个属性有效果，需要配合fillMode使用
        // fillMode 填充模式
        // kCAFillModeForwards（当动画结束后，layer会保持动画最后的显示状态）
        animation.fillMode = kCAFillModeForwards;
        
        // 2.把动画添加到layer上(imageView.layer)
        // key 标识一个动画，一个layer上不能有key相同的动画
        //可以为nil
        //不能写为@"transition", 系统使用这个key标识CATransition的动
        return animation;
    } else {
        // Defer to super's implementation for any keys we don't specifically handle.
        return [super defaultAnimationForKey:key];
    }
}
@end
