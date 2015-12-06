//
//  UIHourlyConditionTableViewHeaderView.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *  const UIHourlyConditionTableViewHeaderViewNibName;

@class ForecastHourlyConditionDisplayData;
@protocol UIHourlyConditionTableViewHeaderViewDataSource;
@interface UIHourlyConditionTableViewHeaderView : UITableViewHeaderFooterView

@property (weak, nonatomic) id<UIHourlyConditionTableViewHeaderViewDataSource>  dataSource;

@end

@protocol UIHourlyConditionTableViewHeaderViewDataSource <NSObject>

- (NSInteger)numberOfHourlyConditionsForHourlyConditionHeaderView:(UIHourlyConditionTableViewHeaderView * )headerView;
- (ForecastHourlyConditionDisplayData * )hourlyConditionHeaderView:(UIHourlyConditionTableViewHeaderView * )haderView hourlyConditionDisplayDataAtIndex:(NSInteger)index;

@end