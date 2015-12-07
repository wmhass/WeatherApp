//
//  ForecastDisplayData+Tests.m
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDisplayData+Tests.h"
#import "ForecastCurrentConditionDisplayData+Tests.h"
#import "ForecastUpcomingConditionDisplayData+Tests.h"

@implementation ForecastDisplayData (Tests)

#pragma mark - Overriden

- (NSUInteger)hash {
    return [self.currentCondition hash] ^ [self.upcomingConditions hash];
}

- (BOOL)isEqual:(id)object {
    if(object == self) {
        return YES;
    }
    return [object hash] == [self hash];
}


@end
