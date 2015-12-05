//
//  UIUpcomingConditionTableViewCell+ForecastUpcomingConditionDisplayData.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "UIUpcomingConditionTableViewCell+ForecastUpcomingConditionDisplayData.h"
#import "ForecastUpcomingConditionDisplayData.h"

@implementation UIUpcomingConditionTableViewCell (ForecastUpcomingConditionDisplayData)

- (void)displayUpcomingCondition:(ForecastUpcomingConditionDisplayData *)displayData {
    self.weekDayLabel.text = displayData.weekDayName;
    self.maxTempLabel.text = displayData.maxTempC;
    self.minTempLabel.text = displayData.minTempC;
}

@end
