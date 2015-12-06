//
//  ForecastHourlyCondition.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastWeatherDescription.h"

@interface ForecastHourlyCondition : NSObject

@property (strong, nonatomic) NSNumber *tempC;
@property (strong, nonatomic) NSNumber *tempF;
@property (strong, nonatomic) NSNumber *chanceOfRain;
@property (strong, nonatomic) NSString *time; // TODO: Check this

- (id )initWithDictionary:(NSDictionary * )dictionary;

@end