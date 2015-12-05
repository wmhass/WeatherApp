//
//  UIHourlyConditionCollectionViewCell+ForecastHourlyConditionDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "UIHourlyConditionCollectionViewCell.h"

@class ForecastHourlyConditionDisplayData;
@interface UIHourlyConditionCollectionViewCell (ForecastHourlyConditionDisplayData)

- (void)displayHourlyCondition:(ForecastHourlyConditionDisplayData *)hourlyCondition;

@end