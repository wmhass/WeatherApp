//
//  ForecastUpcomingCondition.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastUpcomingCondition.h"

@implementation ForecastUpcomingCondition

#pragma mark - Initializers 

- (id _Nonnull)initWithDictionary:(NSDictionary * _Nullable)dictionary {
    self = [super init];
    if (self) {
        _maxTempC = @([dictionary[@"maxtempC"] floatValue]);
        _maxTempF = @([dictionary[@"maxtempF"] floatValue]);
        _minTempC = @([dictionary[@"mintempC"] floatValue]);
        _minTempF = @([dictionary[@"mintempF"] floatValue]);
        _date = [[ForecastUpcomingCondition dateFormatter] dateFromString:dictionary[@"date"]];
    }
    return self;
}

+ (NSDateFormatter * _Nonnull)dateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-mm-dd";
    return formatter;
}

@end
