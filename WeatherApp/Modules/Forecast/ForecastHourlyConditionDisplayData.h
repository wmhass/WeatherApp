//
//  ForecastHourlyConditionDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastHourlyConditionDisplayData : NSObject

@property (strong, nonatomic) NSString * _Nullable temp;
@property (strong, nonatomic) NSString * _Nullable chanceOfRain;
@property (strong, nonatomic) NSString * _Nullable time;

@end
