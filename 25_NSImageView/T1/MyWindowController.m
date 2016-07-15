//
//  MyWindowController.m
//  T1
//
//  Created by 郭韬 on 15/11/16.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyWindowController.h"
#import "MyImageView.h"
#import "CustomView.h"
#import "PersonWindowController.h"

@interface MyWindowController ()<NSGestureRecognizerDelegate>
{
    NSWindow *aboveWindow;
    NSDrawer *drawer;
    NSInteger i;
    NSRect rectT;
    NSRect orgRct;
    NSViewAnimation *animation;

    BOOL        isShow;
    CustomView *view;
    PersonWindowController  *personVC;
}

@end

@implementation MyWindowController
static MyWindowController *SharedInstance;

+(MyWindowController *)shareInsdtance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SharedInstance = [[MyWindowController alloc] initWithWindowNibName:@"MyWindowController"];
        
    });
    [SharedInstance showWindow:self];
    return SharedInstance;

}
- (void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"FromRect = %@",NSStringFromRect(self.window.frame));
  //  NSSize windowSize = self.window.frame.size;
    
    //[clickButton setIgnoresMultiClick:YES];
    orgRct = self.window.frame;
    view = [[CustomView alloc] initWithFrame:NSZeroRect];
    //view = [[CustomView alloc] initWithFrame:NSMakeRect(0, 0, 100, windowSize.height)];

//    drawer = [[NSDrawer alloc] initWithContentSize:NSMakeSize(100,100) preferredEdge:NSRectEdgeMinX];
//    drawer.contentView = view;
//    [drawer setMaxContentSize:NSMakeSize(100, windowSize.height)];
//    [drawer setMaxContentSize:NSMakeSize(100, windowSize.height)];
//    [drawer setParentWindow:self.window];
    
   // NSRect rect = NSMakeRect(120, 250,150, 150);
    
    aboveWindow = [[NSWindow alloc] initWithContentRect:NSZeroRect styleMask:NSBorderlessWindowMask backing:NSBackingStoreBuffered defer:NO screen:[NSScreen mainScreen]];
    [aboveWindow setTitle:@"1111"];
    view.myWindow = self.window;
    view.block = ^(BOOL is)
    {
        isShow   = YES;
    };
    [aboveWindow setContentView:view];
    aboveWindow.backgroundColor = [NSColor clearColor];
    
    [self.window addChildWindow:aboveWindow ordered:NSWindowBelow];
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
   /*
    NSGestureRecognizer *gestureRecognizer = [[NSGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
    gestureRecognizer.state    = NSGestureRecognizerStateBegan;
    gestureRecognizer.enabled  = NO;
    gestureRecognizer.delegate = self;
    [_imageView addGestureRecognizer:gestureRecognizer];
    */
    //设置视图可穿透ToolBar栏
    self.window.styleMask = self.window.styleMask | NSFullSizeContentViewWindowMask;
    self.window.titleVisibility = NSWindowTitleHidden;
    self.window.titlebarAppearsTransparent = YES;
    
    [_imageView setAction:@selector(click:)];
    [_imageView setTarget:self];
    //[_imageView mouseDown:<#(nonnull NSEvent *)#>]
}

- (void) mouseDown:(NSEvent *)theEvent {

    //[NSApp sendAction:@selector(click:) to:_imageView.target from:self];
    //[_imageView mouseDown:theEvent];
}

- (void)click:(id)sender{
    
    if (personWindowCtr == nil) {
        
        personWindowCtr = [[PersonWindowController alloc] initWithWindowNibName:@"PersonWindow"];
    }
    [personWindowCtr showWindow:self];
}
- (IBAction)sendImage:(id)sender{
    
   // NSRect rect = self.window.frame;
    CGPoint orgPoint = self.window.frame.origin;
    NSLog(@"point = %@",NSStringFromPoint(orgPoint));
    // NSView *view = [NSView alloc] initWithFrame:<#(NSRect)#>
}
- (IBAction)showView:(id)sender
{
    if (i == 0)
    {
        //登陆时的动画效果
        NSRect endFrame = NSMakeRect(orgRct.origin.x-150, orgRct.origin.y,150, 150);
        NSRect startFrame = NSMakeRect(orgRct.origin.x ,orgRct.origin.y, 150, 150);
        NSDictionary *animationInfo = @{
                                        //执行动画的目标对象
                                        NSViewAnimationTargetKey : aboveWindow,
                                        //开始时的frame
                                        NSViewAnimationStartFrameKey:[NSValue valueWithRect:startFrame],
                                        //结束动画时的值
                                        NSViewAnimationEndFrameKey : [NSValue valueWithRect:endFrame],
                                        //对key执行动画的行为（逐渐消失的效果）
                                        NSViewAnimationEffectKey : NSViewAnimationEffectKey
                                        };
        animation = [[NSViewAnimation alloc] initWithViewAnimations:@[animationInfo]];
      //  animation.delegate = self;
        animation.duration = 0.35;
        animation.animationBlockingMode = NSAnimationBlocking;
        [animation startAnimation];
        i++;
    }
    else if(i == 1)
    {
        
        i=0;
        //登陆时的动画效果
        NSRect startFrame = NSMakeRect(orgRct.origin.x-150, orgRct.origin.y,150, 150);
        NSRect endFrame = NSMakeRect(orgRct.origin.x ,orgRct.origin.y, 150, 150);
        NSDictionary *animationInfo = @{
                                        //执行动画的目标对象
                                        NSViewAnimationTargetKey : aboveWindow,
                                        //开始时的frame
                                        NSViewAnimationStartFrameKey:[NSValue valueWithRect:startFrame],
                                        //结束动画时的值
                                        NSViewAnimationEndFrameKey : [NSValue valueWithRect:endFrame],
                                        //对key执行动画的行为（逐渐消失的效果）
                                        NSViewAnimationEffectKey : NSViewAnimationEffectKey
                                        };
        animation = [[NSViewAnimation alloc] initWithViewAnimations:@[animationInfo]];
        //  animation.delegate = self;
        animation.duration = 0.35;
        animation.animationBlockingMode = NSAnimationBlocking;
        [animation startAnimation];
        
    }
    //[aboveWindow setContentView:view];
    //[aboveWindow makeKeyAndOrderFront:sender];
    //
   // [aboveWindow makeKeyAndOrderFront:sender];
    //196, 240
    //CGPoint orgPoint = self.window.frame.origin;
 
   // [self.window.contentView addSubview:view positioned:NSWindowOut relativeTo:nil];
  //  NSLog(@"point = %@",NSStringFromPoint(orgPoint));

}
- (BOOL)gestureRecognizer:(NSGestureRecognizer *)gestureRecognizer shouldAttemptToRecognizeWithEvent:(NSEvent *)event{
  
    return YES;
}
- (void)windowWillMove:(NSNotification *)notification
{
    [self.window setFrame:orgRct display:YES];
    NSLog(@"move = %@",NSStringFromRect(self.window.frame));
}
- (void)windowDidMove:(NSNotification *)notification
{
    if (isShow)
    {
        [self.window setFrame:orgRct display:YES];
        isShow = NO;
    }
    
    orgRct = self.window.frame;
}
- (IBAction)showCustomWindow:(id)sender
{
    if (personVC == nil)
    {
        personVC = [[PersonWindowController alloc] initWithWindowNibName:@"PersonWindow"];
    }
    [personVC showWindow:self];
}
@end
