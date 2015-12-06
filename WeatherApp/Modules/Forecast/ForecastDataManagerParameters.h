//
//  ForecastDataManagerParameters.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastDataManagerParameters : NSObject

@property (strong, nonatomic) NSString *cityName;
@property (strong, nonatomic) NSNumber *numberOfDays;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *longitude;

@end
