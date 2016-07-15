//
//  CustomButton.m
//  Mac_test_4
//
//  Created by 郭韬 on 15/10/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton
- (instancetype)initWithFrame:(NSRect)frameRect{
    
    self = [super initWithFrame:frameRect];
    if (self) {
        
        CustomButtonCell *cell = [[CustomButtonCell alloc] init];
        [self setCell:cell];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
    
    self = [super initWithCoder:coder];
    if (self) {
        
       
    }
    return self;
}
//鼠标按动button时触发的行为
//- (void)mouseDown:(NSEvent *)theEvent{
//    
//    NSLog(@"dsds");
//}
@end
@implementation CustomButtonCell

- (instancetype)init{
    
    self = [super init];
    if(self){
        
       // [self setAction:@selector(cellAction)];
    }
    return self;
}
- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView{
    
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithAttributedString:[self attributedTitle]];
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    [attrTitle addAttribute:NSForegroundColorAttributeName
                      value:[NSColor redColor]
                      range:range];
    //[self cellAction];
    [attrTitle fixAttachmentAttributeInRange:range];
    //如果点击按钮显示高亮状态（字体变颜色）
    if ([self isHighlighted]) {
        return [super drawTitle:attrTitle withFrame:frame inView:controlView];
    }
    
    return [super drawTitle:[self attributedTitle] withFrame:frame inView:controlView];
}
- (void)cellAction{
    
    NSLog(@"1311");
}
@end