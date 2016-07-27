//
//  UICollectionViewRoundLayout.h
//  collectionView
//
//  Created by 罗向宇 on 16/7/26.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UICollectionViewRoundLayout : UICollectionViewLayout

@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign) NSInteger itemCount;
@property (nonatomic, assign) NSInteger itemCountEachEdge;
@property (nonatomic, assign) UIEdgeInsets sectionInset;

@end
