//
//  MyViewController.m
//  Mac_Popover
//
//  Created by 郭韬 on 15/11/23.
//  Copyright © 2015年 33e9. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)awakeFromNib
{
    content = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 35; i++)
    {
        
        NSImage *image = [NSImage imageNamed:[NSString stringWithFormat:@"%d.gif",i+1]];
        [content addObject:image];
    }
   
}
#pragma mark - CollectionView Datasource
- (NSUInteger)numberOfCellsInCollectionView:(JUCollectionView *)collectionView
{
    
    NSLog(@"content = %ld",[content count]);
    return content.count;
}
- (JUCollectionViewCell *)collectionViewCell:(JUCollectionView *)collectionView cellForIndex:(NSUInteger)index
{
    JUCollectionViewCell *cell = [collectionView dequeueReusableCellWithIdentifier:@"Cell_Identifier"];
    if (cell == nil) {
        
        cell = [[JUCollectionViewCell alloc] initWithReuseIdentifier:@"Cell_Identifier"];
        [cell setImage:[content objectAtIndex:index]];
    }
    return cell;
}

- (void)collectionView:(JUCollectionView *)collectionView didDeselectCellAtIndex:(NSUInteger)index
{
    
  
    // NSLog(@"selected cell at index : %ld",index);
   // NSLog(@"Position : %@",NSStringFromPoint([collectionView positionOfCellAtIndex:index]));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [collectionView1 setCellSize:NSMakeSize(32, 32)];
    [collectionView1 reloadData];
    // Do view setup here.
}

@end
