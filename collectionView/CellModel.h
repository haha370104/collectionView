//
//  CellModel.h
//  collectionView
//
//  Created by 罗向宇 on 16/7/25.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CellModel : UICollectionViewCell

@property (nonatomic) UIColor *cellColor;
@property (nonatomic) NSString *cellString;
@property (nonatomic) Boolean moveFlag;

- (id)initWithColorAndText:(UIColor *)cellColor cellText:(NSString *)cellString;

@end
