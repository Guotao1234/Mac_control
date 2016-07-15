//
//  MyViewController.h
//  Mac_Popover
//
//  Created by 郭韬 on 15/11/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JUCollectionView.h"
@interface MyViewController : NSViewController<JUCollectionViewDataSource,JUCollectionViewDelegate>
{
    
    IBOutlet JUCollectionView *collectionView1;
    NSMutableArray *content;
}
@end
