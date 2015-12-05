//
//  ForecastDataManagerParameters.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastDataManagerParameters : NSObject

@property (strong, nonatomic, readonly) NSString * _Nullable cityName;
@property (strong, nonatomic, readonly) NSNumber * _Nullable numberOfDays;

- (id _Nonnull)initWithCityName:(NSString * _Nonnull)cityName numberOfDays:(NSNumber * _Nullable)numberOfDays;

@end
