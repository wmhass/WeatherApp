//
//  UIHourlyConditionTableViewHeaderView.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "UIHourlyConditionTableViewHeaderView.h"
#import "UIHourlyConditionCollectionViewCell+ForecastHourlyConditionDisplayData.h"

NSString * const UIHourlyConditionTableViewHeaderViewNibName = @"UIHourlyConditionTableViewHeaderView";

@interface UIHourlyConditionTableViewHeaderView() <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView * hourlyConditionCollectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topKeylineHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomKeylineHeightConstraint;

@end

@implementation UIHourlyConditionTableViewHeaderView


#pragma mark - Lifecycle

- (void)awakeFromNib {
    UINib *cellNib = [UINib nibWithNibName:UIHourlyConditionCollectionViewCellNibName bundle:nil];
    [self.hourlyConditionCollectionView registerNib:cellNib forCellWithReuseIdentifier:UIHourlyConditionCollectionViewCellReuseIdentifier];
    
    self.topKeylineHeightConstraint.constant = .5f;
    self.bottomKeylineHeightConstraint.constant = .5f;
}


#pragma mark - Private

- (void)reloadContent {
    [self.hourlyConditionCollectionView reloadData];
}


#pragma mark - Public

- (void)setDataSource:(id<UIHourlyConditionTableViewHeaderViewDataSource>)dataSource {
    _dataSource = dataSource;
    [self reloadContent];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource numberOfHourlyConditionsForHourlyConditionHeaderView:self];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UIHourlyConditionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:UIHourlyConditionCollectionViewCellReuseIdentifier forIndexPath:indexPath];
    
    [cell displayHourlyCondition:[self.dataSource hourlyConditionHeaderView:self hourlyConditionDisplayDataAtIndex:indexPath.item]];
    
    return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

@end