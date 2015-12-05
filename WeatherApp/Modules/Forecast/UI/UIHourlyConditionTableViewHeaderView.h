//
//  UIHourlyConditionTableViewHeaderView.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * _Nonnull const UIHourlyConditionTableViewHeaderViewNibName;

@class ForecastHourlyConditionDisplayData;
@protocol UIHourlyConditionTableViewHeaderViewDataSource;
@interface UIHourlyConditionTableViewHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) id<UIHourlyConditionTableViewHeaderViewDataSource> _Nullable dataSource;

@end

@protocol UIHourlyConditionTableViewHeaderViewDataSource <NSObject>

- (NSInteger)numberOfHourlyConditionsForHourlyConditionHeaderView:(UIHourlyConditionTableViewHeaderView * _Nonnull)headerView;
- (ForecastHourlyConditionDisplayData * _Nonnull)hourlyConditionHeaderView:(UIHourlyConditionTableViewHeaderView * _Nonnull)haderView hourlyConditionDisplayDataAtIndex:(NSInteger)index;

@end