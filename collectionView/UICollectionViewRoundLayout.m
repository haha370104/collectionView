//
//  UICollectionViewRoundLayout.m
//  collectionView
//
//  Created by 罗向宇 on 16/7/26.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UICollectionViewRoundLayout.h"


@implementation UICollectionViewRoundLayout

- (void)prepareLayout
{
    [super prepareLayout];
    self.itemCount = [self.collectionView numberOfItemsInSection:0];
    self.itemCountEachEdge = self.itemCount / 4 + 1;
    CGFloat maxEdgeInsetX = MAX(self.sectionInset.left, self.sectionInset.right);
    self.itemWidth = self.collectionView.bounds.size.width / (CGFloat)self.itemCountEachEdge - (self.sectionInset.left + self.sectionInset.right + maxEdgeInsetX * (self.itemCountEachEdge - 1)) / self.itemCountEachEdge;
    self.itemHeight = self.itemWidth;
}

- (CGSize)collectionViewContentSize
{
    return self.collectionView.bounds.size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attribute.size = CGSizeMake(self.itemWidth, self.itemHeight);
    NSInteger index = indexPath.item;
    CGFloat maxEdgeInsetX = MAX(self.sectionInset.left, self.sectionInset.right);
    CGFloat maxEdgeInsetY = MAX(self.sectionInset.bottom, self.sectionInset.top);
    if (index < self.itemCountEachEdge) { //第一行
        CGRect itemFrame = CGRectMake(0, 0, self.itemWidth, self.itemHeight);
        itemFrame.origin.y = self.sectionInset.top;
        itemFrame.origin.x = index * (maxEdgeInsetX + self.itemWidth) + maxEdgeInsetX;
        attribute.frame = itemFrame;
    } else if (index < 4 * self.itemCountEachEdge - 8) {                //空心行
        NSInteger rowNumber = (index - self.itemCountEachEdge) / 2 + 1; //从第一行开始计数
        NSInteger colomnNumber = (index - self.itemCountEachEdge) % 2;
        CGRect itemFrame = CGRectMake(0, 0, self.itemWidth, self.itemHeight);
        if (colomnNumber == 0) { //空心行左边
            itemFrame.origin.x = self.sectionInset.left;
        } else { //空心行右边
            itemFrame.origin.x = self.collectionView.bounds.size.width - self.sectionInset.right - self.itemWidth;
        }
        itemFrame.origin.y = rowNumber * (self.sectionInset.bottom + self.itemWidth) + self.sectionInset.top;
        attribute.frame = itemFrame;
    } else if (index < self.itemCount) { //最后一行
        NSInteger columnNumber = index + self.itemCountEachEdge - self.itemCount;
        CGRect itemFrame = CGRectMake(0, 0, self.itemWidth, self.itemHeight);
        itemFrame.origin.y = self.sectionInset.top + (maxEdgeInsetY + self.itemWidth) * (self.itemCountEachEdge - 1);
        itemFrame.origin.x = columnNumber * (maxEdgeInsetX + self.itemWidth) + maxEdgeInsetX;
        attribute.frame = itemFrame;
    }
    return attribute;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < self.itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [array addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return array;
}

@end
