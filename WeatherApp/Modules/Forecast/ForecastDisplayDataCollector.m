//
//  ForecastDisplayDataCollector.m
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDisplayDataCollector.h"
#import "ForecastDisplayData.h"
#import "ForecastCurrentCondition.h"
#import "ForecastCurrentConditionDisplayData.h"
#import "ForecastUpcomingCondition.h"
#import "ForecastUpcomingConditionDisplayData.h"

@interface ForecastDisplayDataCollector()

@property (strong, nonatomic) ForecastCurrentConditionDisplayData *currentCondition;
@property (strong, nonatomic) NSMutableArray <ForecastUpcomingConditionDisplayData *> *upcomingConditions;

@end

@implementation ForecastDisplayDataCollector

#pragma mark - Private

- (void)collectUpcomingCondition:(ForecastUpcomingCondition *)upcomingCondition {
    [self.upcomingConditions addObject:[self upcomingDisplayDataWithUpcomingContidion:upcomingCondition]];
}

- (ForecastUpcomingConditionDisplayData *)upcomingDisplayDataWithUpcomingContidion:(ForecastUpcomingCondition *)upcomingCondition {
    ForecastUpcomingConditionDisplayData *displayData = [[ForecastUpcomingConditionDisplayData alloc] init];
    //TODO: Set values
    return displayData;
}

- (ForecastCurrentConditionDisplayData *)currentConditionDisplayDataFromCurrentCondition:(ForecastCurrentCondition *)currentCondition {
    ForecastCurrentConditionDisplayData *displayData = [[ForecastCurrentConditionDisplayData alloc] init];
    //TODO: Set values
    return displayData;
}


#pragma mark - Public

- (void)collectCurrentCondition:(ForecastCurrentCondition *)currentCondition {
    self.currentCondition = [self currentConditionDisplayDataFromCurrentCondition:currentCondition];
}

- (void)collectUpcomingConditions:(NSArray <ForecastUpcomingCondition *> *)upcomingConditions {
    for (ForecastUpcomingCondition * upcomingCondition in upcomingConditions) {
        [self collectUpcomingCondition:upcomingCondition];
    }
}

- (ForecastDisplayData *)collectedData {
    return [[ForecastDisplayData alloc] initWithCurrentCondition:self.currentCondition upcomingConditions:self.upcomingConditions];
    
}

@end
