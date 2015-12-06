//
//  ForecastUpcomingCondition.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastUpcomingCondition : NSObject

@property (strong, nonatomic) NSDate *date;

@property (strong, nonatomic) NSNumber *maxTempC;
@property (strong, nonatomic) NSNumber *maxTempF;

@property (strong, nonatomic) NSNumber *minTempC;
@property (strong, nonatomic) NSNumber *minTempF;

- (id )initWithDictionary:(NSDictionary * )dictionary;

@end
