//
//  JUCollectionViewAppDelegate.m
//  JUCollectionView
//
//  Copyright (c) 2011 by Sidney Just
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
//  the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
//  and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
//  PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
//  FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
//  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (NSUInteger)numberOfCellsInCollectionView:(JUCollectionView *)view
{
    NSLog(@"content ＝ %lu",[content count]);
    return [content count];
}

- (JUCollectionViewCell *)collectionView:(JUCollectionView *)view cellForIndex:(NSUInteger)index
{
    JUCollectionViewCell *cell = [view dequeueReusableCellWithIdentifier:@"cell"];
    
    if(!cell)
        cell = [[[JUCollectionViewCell alloc] initWithReuseIdentifier:@"cell"] autorelease];
    
    [cell setImage:[content objectAtIndex:index]];
    
    return cell;
}

- (void)collectionView:(JUCollectionView *)_collectionView didSelectCellAtIndex:(NSUInteger)index
{
    NSLog(@"Selected cell at index: %u", (unsigned int)index);
    NSLog(@"Position: %@", NSStringFromPoint([_collectionView positionOfCellAtIndex:index]));
}




- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    content = [[NSMutableArray alloc] init];
    
    for(int i=0; i<35; i++) // This creates 59000 elements!
    {
        NSImage *image = [NSImage imageNamed:[NSString stringWithFormat:@"%d.gif",i+1]];
        [content addObject:image];
    }
    [collectionView reloadData];
    [collectionView setCellSize:NSMakeSize(32.0, 32.0)];
    
}

@end
