//
//  ForecastCurrentConditionDisplayData+Tests.m
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastCurrentConditionDisplayData+Tests.h"
#import "ForecastHourlyConditionDisplayData.h"

@implementation ForecastCurrentConditionDisplayData (Tests)

#pragma mark - Overriden

- (NSUInteger)hash {
    return [self.temp hash] ^ [self.feelsLike hash] ^ [self.humidity hash] ^ [self.observationTime hash] ^ [self.weatherDescription hash] ^ [self.hourlyConditions hash];
}

- (BOOL)isEqual:(id)object {
    if(object == self) {
        return YES;
    }
    return [object hash] == [self hash];
}

@end
