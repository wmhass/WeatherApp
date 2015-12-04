//
//  ForecastWeatherDescription.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastWeatherDescription.h"

@interface ForecastWeatherDescription()

@property (strong, nonatomic) NSArray<NSString *> *values;

@end

@implementation ForecastWeatherDescription

#pragma mark - Initializers

- (id _Nonnull)initWithValues:(NSArray<NSString *> * _Nullable)values {
    self = [super init];
    if (self) {
        _values = values;
    }
    return self;
}

#pragma mark - Public (Rewrtitten)

- (NSString * _Nullable)description {
    return [self.values componentsJoinedByString:@", "];
}

@end
