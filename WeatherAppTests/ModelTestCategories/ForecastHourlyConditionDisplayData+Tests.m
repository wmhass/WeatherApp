//
//  ForecastHourlyConditionDisplayData+Tests.m
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastHourlyConditionDisplayData+Tests.h"

@implementation ForecastHourlyConditionDisplayData (Tests)

#pragma mark - Overriden

- (NSUInteger)hash {
    return [self.temp hash] ^ [self.chanceOfRain hash] ^ [self.time hash];
}

- (BOOL)isEqual:(id)object {
    if(object == self) {
        return YES;
    }
    return [object hash] == [self hash];
}


@end
