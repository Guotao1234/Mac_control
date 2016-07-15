//
//  PreferenceController.m
//  12_NibAndNSWindowController
//
//  Created by 郭韬 on 15/10/30.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "PreferenceController.h"
NSString *const BNRTableBgColorKey = @"tableBackgroundColor";
NSString *const BNREmptyDocKey = @"EmptyDocumentFlag";
NSString *const BNRColorChangedNotification = @"BNRColorChanged";
@interface PreferenceController ()

@end

@implementation PreferenceController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (NSColor *)tableBgColor{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *colorAsData = [defaults objectForKey:BNRTableBgColorKey];
    //解档，返回一个归档前的一个对象
    return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData];
}
- (BOOL)emptyDoc{
    NSUserDefaults *defauilts = [NSUserDefaults standardUserDefaults];
    return [defauilts boolForKey:BNREmptyDocKey];
}
//更新当前的设定defaults database
- (IBAction)changeBackgroundColor:(id)sender{
    
    NSColor *color = [colorWell color];
    NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:color];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:colorAsData forKey:BNRTableBgColorKey];
    //把改变颜色的信息发送过去
    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:color,@"changColor",nil];
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:BNRColorChangedNotification object:self userInfo:userInfo];
   // NSLog(@"Color changed :%@",color);
}
- (IBAction)changeNewEmptyDoc:(id)sender{
    
    NSInteger state = [checkbox state];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:state forKey:BNREmptyDocKey];
    NSLog(@"Checkbox changed %ld",state);
}
@end
