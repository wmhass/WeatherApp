//
//  ForecastWeatherDescription.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastWeatherDescription.h"

@interface ForecastWeatherDescription()

@property (strong, nonatomic) NSArray<NSDictionary *> *values;

@end

@implementation ForecastWeatherDescription

#pragma mark - Initializers

- (id _Nonnull)initWithValues:(NSArray<NSDictionary *> * _Nullable)values {
    self = [super init];
    if (self) {
        _values = values;
    }
    return self;
}

#pragma mark - Public (Rewrtitten)

- (NSString * _Nonnull)description {
    NSMutableArray *values = [[NSMutableArray alloc] initWithCapacity:self.values.count];
    [self.values enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [values addObject:obj[@"value"]];
    }];
    return [values componentsJoinedByString:@", "];
}

@end
