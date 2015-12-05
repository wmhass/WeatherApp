//
//  ForecastHourlyConditionDisplayData.m
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastHourlyConditionDisplayData.h"

@implementation ForecastHourlyConditionDisplayData

#pragma mark - Public

- (NSString *)time {

    NSInteger intTime = [_time integerValue]/100;
    NSString *amPm = intTime > 12 ? @"PM" : @"AM";
    
    return [NSString stringWithFormat:@"%d%@",(int)intTime,amPm];
}

@end
