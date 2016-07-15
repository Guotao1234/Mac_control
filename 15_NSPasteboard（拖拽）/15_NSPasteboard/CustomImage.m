//
//  CustomImage.m
//  15_NSPasteboard
//
//  Created by 郭韬 on 15/12/8.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "CustomImage.h"

@implementation CustomImage

- (void)awakeFromNib{
    
}
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
- (NSDragOperation)draggingSession:(NSDraggingSession *)session sourceOperationMaskForDraggingContext:(NSDraggingContext)context{
    
    /*------------------------------------------------------
     NSDraggingSource protocol method.  Returns the types of operations allowed in a certain context.
     --------------------------------------------------------*/
    switch (context) {
        case NSDraggingContextOutsideApplication:
            return NSDragOperationCopy;
            
            //by using this fall through pattern, we will remain compatible if the contexts get more precise in the future.
        case NSDraggingContextWithinApplication:
        default:
            return NSDragOperationCopy;
            break;
    }

}
//把事件放到成员变量中
- (void)mouseDown:(NSEvent *)theEvent{
    
    self.mouseEvent = theEvent;
    [super mouseDown:theEvent];
    NSLog(@"鼠标按下");
    
}
- (void)mouseDragged:(NSEvent *)theEvent{
    
    NSPoint down = [self.mouseEvent locationInWindow];
    NSPoint drag = [theEvent locationInWindow];
    
    //获取mouseDown事件的位置
    NSPoint p = [self convertPoint:down fromView:nil];
    //从中心开始拖拽
    p.x = p.x - self.frame.size.width/2;
    p.y = p.y - self.frame.size.height/2;
    
    NSRect rect = NSMakeRect(p.x, p.y, self.bounds.size.width, self.bounds.size.height);
    NSPasteboardItem *pbItem = [NSPasteboardItem new];
    
    [pbItem setDataProvider:self forTypes:[NSArray arrayWithObjects:NSPasteboardTypeTIFF, NSPasteboardTypePDF,nil]];
    NSDraggingItem *dragItem = [[NSDraggingItem alloc] initWithPasteboardWriter:pbItem];
    [dragItem setDraggingFrame:rect contents:[self image]];
    
    NSDraggingSession *session = [self beginDraggingSessionWithItems:[NSArray arrayWithObject:dragItem] event:theEvent source:self];
    
    session.animatesToStartingPositionsOnCancelOrFail = YES;
    session.draggingFormation = NSDraggingFormationNone;
}
//给拖拽的图片定义数据类型，以便接受的剪切版解析数据
- (void)pasteboard:(NSPasteboard *)sender item:(NSPasteboardItem *)item provideDataForType:(NSString *)type
{
    /*------------------------------------------------------
     method called by pasteboard to support promised
     drag types.
     --------------------------------------------------------*/
    //sender has accepted the drag and now we need to send the data for the type we promised
    if ( [type compare: NSPasteboardTypeTIFF] == NSOrderedSame ) {
        
        //set data for TIFF type on the pasteboard as requested
        [sender setData:[[self image] TIFFRepresentation] forType:NSPasteboardTypeTIFF];
        
    } else if ( [type compare: NSPasteboardTypePDF] == NSOrderedSame ) {
        
        //set data for PDF type on the pasteboard as requested
        [sender setData:[self dataWithPDFInsideRect:[self bounds]] forType:NSPasteboardTypePDF];
    }
    
}
@end
