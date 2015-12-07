//
//  ForecastUpcomingConditionDisplayData+Tests.m
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastUpcomingConditionDisplayData+Tests.h"

@implementation ForecastUpcomingConditionDisplayData (Tests)

#pragma mark - Overriden

- (NSUInteger)hash {
    return [self.maxTemp hash] ^ [self.minTemp hash] ^ [self.weekDayName hash];
}

- (BOOL)isEqual:(id)object {
    if(object == self) {
        return YES;
    }
    return [object hash] == [self hash];
}



@end
