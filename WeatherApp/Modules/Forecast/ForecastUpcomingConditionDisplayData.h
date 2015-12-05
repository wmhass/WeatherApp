//
//  ForecastUpcomingConditionDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastUpcomingConditionDisplayData : NSObject

@property (strong, nonatomic) NSString * _Nullable maxTemp;
@property (strong, nonatomic) NSString * _Nullable minTemp;
@property (strong, nonatomic) NSString * _Nullable weekDayName;

@end