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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.cellLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self addSubview:self.cellLabel];
    }
    return self;
}

@end
