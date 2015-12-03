//
//  ForecastCurrentCondition.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastWeatherDescription.h"
@interface ForecastCurrentCondition : NSObject

@property (strong, nonatomic) NSNumber *tempC;
@property (strong, nonatomic) NSNumber *tempF;
@property (strong, nonatomic) NSNumber *feelsLikeC;
@property (strong, nonatomic) NSNumber *feelsLikeF;
@property (strong, nonatomic) NSNumber *humidity;
@property (strong, nonatomic) NSString *observationTime;
@property (strong, nonatomic) ForecastWeatherDescription *weatherDescription;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end