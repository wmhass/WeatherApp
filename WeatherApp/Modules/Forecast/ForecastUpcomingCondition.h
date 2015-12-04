//
//  ForecastUpcomingCondition.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastUpcomingCondition : NSObject

@property (strong, nonatomic) NSDate * _Nullable date;

@property (strong, nonatomic) NSNumber * _Nullable maxTempC;
@property (strong, nonatomic) NSNumber * _Nullable maxTempF;

@property (strong, nonatomic) NSNumber * _Nullable minTempC;
@property (strong, nonatomic) NSNumber * _Nullable minTempF;

- (id _Nonnull)initWithDictionary:(NSDictionary * _Nullable)dictionary;

@end
