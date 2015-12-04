//
//  ForecastUpcomingConditionDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastUpcomingConditionDisplayData : NSObject

@property (strong, nonatomic) NSString *maxTempC;
@property (strong, nonatomic) NSString *maxTempF;
@property (strong, nonatomic) NSString *minTempF;
@property (strong, nonatomic) NSString *minTempC;
@property (strong, nonatomic) NSString *weekDayName;

@end