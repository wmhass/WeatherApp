//
//  ForecastDataManagerParameters.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastDataManagerParameters : NSObject

@property (strong, nonatomic) NSString * _Nullable cityName;
@property (strong, nonatomic) NSNumber * _Nullable numberOfDays;
@property (strong, nonatomic) NSString * _Nullable latitude;
@property (strong, nonatomic) NSString * _Nullable longitude;

@end
