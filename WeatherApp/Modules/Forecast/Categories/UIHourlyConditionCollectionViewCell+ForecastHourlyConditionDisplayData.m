//
//  UIHourlyConditionCollectionViewCell+ForecastHourlyConditionDisplayData.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "UIHourlyConditionCollectionViewCell+ForecastHourlyConditionDisplayData.h"
#import "ForecastHourlyConditionDisplayData.h"

@implementation UIHourlyConditionCollectionViewCell (ForecastHourlyConditionDisplayData)

#pragma mark - Public

- (void)displayHourlyCondition:(ForecastHourlyConditionDisplayData *)hourlyCondition {
    self.timeLabel.text = hourlyCondition.time;
    self.temperatureLabel.text = hourlyCondition.tempC;
}

@end
