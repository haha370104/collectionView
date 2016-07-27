//
//  CellModel.m
//  collectionView
//
//  Created by 罗向宇 on 16/7/25.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "CellModel.h"


@implementation CellModel

- (id)initWithColorAndText:(UIColor *)cellColor cellText:(NSString *)cellString
{
    self = [super init];
    if (self) {
        self.cellColor = cellColor;
        self.cellString = cellString;
    }
    return self;
}

- (void)setPropertyWithColor:(UIColor *)color cellText:(NSString *)string
{
    self.cellColor = color;
    self.cellString = string;
}

@end
