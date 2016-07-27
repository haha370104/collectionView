//
//  BXCollectionCell.m
//  collectionView
//
//  Created by 罗向宇 on 16/7/26.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "BXCollectionCell.h"


@interface BXCollectionCell ()

@property (nonatomic, strong) UILabel *cellLabel;

@end


@implementation BXCollectionCell

#pragma mark - init -

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.cellLabel];
    }
    return self;
}

#pragma mark - lifecycle -

- (void)prepareForReuse
{
    self.cellLabel.text = @"";
}

#pragma mark - getter && setter -

- (UILabel *)cellLabel
{
    if(!_cellLabel){
        _cellLabel = [[UILabel alloc] initWithFrame:self.bounds];
    }
    return _cellLabel;
}

@end
