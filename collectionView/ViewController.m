//
//  viewController.m
//  collectionView
//
//  Created by 罗向宇 on 16/7/25.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"
#import "XWDragCellCollectionView.h"
#import "BXCollectionCell.h"
#import "UICollectionViewRoundLayout.h"


@interface ViewController () <XWDragCellCollectionViewDataSource, XWDragCellCollectionViewDelegate>

@property (nonatomic) NSArray *cellArray;
@property (nonatomic, strong) NSArray<NSNumber *> *notMoveIndexArray;

@end


@implementation ViewController

#pragma mark - lifecycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initCollectionView];
    [self initCellArray:6];
}

#pragma mark - datasource -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BXCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([BXCollectionCell class]) forIndexPath:indexPath];
    cell.cellLabel.text = [NSString stringWithFormat:@"title%ld", (long)indexPath.item];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (NSArray *)dataSourceArrayOfCollectionView:(XWDragCellCollectionView *)collectionView
{
    return self.cellArray;
}

#pragma mark - delegate -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel *model = self.cellArray[indexPath.item];
    NSLog(@"点击了%@", model.cellString);
}

- (void)dragCellCollectionView:(XWDragCellCollectionView *)collectionView newDataArrayAfterMove:(NSArray *)newDataArray
{
    self.cellArray = newDataArray;
}

#pragma mark - private -

- (void)initCollectionView
{
    UICollectionViewRoundLayout *layout = [[UICollectionViewRoundLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    XWDragCellCollectionView *mainView = [[XWDragCellCollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];

    mainView.delegate = self;
    mainView.dataSource = self;
    mainView.shakeLevel = 5.0f;
    mainView.backgroundColor = [UIColor whiteColor];
    [mainView registerClass:[BXCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([BXCollectionCell class])];
    [self.view addSubview:mainView];
}

- (void)initCellArray:(NSInteger)rowNumber
{
    NSInteger itemCount = rowNumber * 4 - 4;
    NSMutableArray *cellArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < itemCount; i++) {
        CellModel *cell;
        cell = [[CellModel alloc] initWithColorAndText:[UIColor redColor] cellText:[NSString stringWithFormat:@"title%d", i]];
        [cellArray addObject:cell];
    }
    self.cellArray = cellArray.copy;
}

@end
