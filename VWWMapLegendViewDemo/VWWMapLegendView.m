//
//  VWWMapLegendView.m
//  VWWMapLegendViewDemo
//
//  Created by Zakk Hoyt on 5/18/15.
//  Copyright (c) 2015 Zakk Hoyt. All rights reserved.
//

#import "VWWMapLegendView.h"


@interface VWWMapLegendView ()
@property (nonatomic, strong) NSArray *optionDictionaries;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@interface VWWMapLegendView (UICollectionView) <UICollectionViewDataSource, UICollectionViewDelegate>

@end
@implementation VWWMapLegendView

- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.1];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"legend"];
    [self addSubview:self.collectionView];
}


#pragma mark Public methods
-(void)show{
    NSUInteger count = [self.dataSource numberOfItemsInLegendView];
    NSMutableArray *optionDictionaries = [[NSMutableArray alloc]initWithCapacity:count];
    for(NSUInteger index = 0; index < count; index++){
        NSDictionary *dictionary = [self.dataSource legendView:self itemForItemAtIndex:index];
        [optionDictionaries addObject:dictionary];
    }
    self.optionDictionaries = [NSArray arrayWithArray:optionDictionaries];
    
    [self.collectionView reloadData];
}

@end

@implementation VWWMapLegendView (UICollectionView)

#pragma mark UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.optionDictionaries.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"legend" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}


#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.bounds.size.width / 2.0, 44);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}





@end
