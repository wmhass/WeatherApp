//
//  NSNumber+TemperatureFormatter.m
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "NSNumber+TemperatureFormatter.h"

@implementation NSNumber (TemperatureFormatter)

- (NSString * _Nonnull)wmh_stringTemperature {
    return [NSString stringWithFormat:@"%.0f°",[self floatValue]];
}

@end
