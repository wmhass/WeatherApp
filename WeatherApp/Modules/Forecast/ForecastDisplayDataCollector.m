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
#import "ForecastHourlyCondition.h"
#import "ForecastHourlyConditionDisplayData.h"
#import "NSNumber+TemperatureFormatter.h"

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
    
    displayData.maxTempC = [upcomingCondition.maxTempC wmh_stringTemperature];
    displayData.maxTempF = [upcomingCondition.maxTempF wmh_stringTemperature];
    displayData.minTempF = [upcomingCondition.minTempF wmh_stringTemperature];
    displayData.minTempC = [upcomingCondition.minTempC wmh_stringTemperature];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEE";
    displayData.weekDayName = [dateFormatter stringFromDate:upcomingCondition.date];
    
    return displayData;
}

- (ForecastCurrentConditionDisplayData *)currentConditionDisplayDataFromCurrentCondition:(ForecastCurrentCondition *)currentCondition {
    
    ForecastCurrentConditionDisplayData *displayData = [[ForecastCurrentConditionDisplayData alloc] init];
    
    displayData.tempC = [currentCondition.tempC wmh_stringTemperature];
    displayData.tempF = [currentCondition.tempF wmh_stringTemperature];
    displayData.feelsLikeC = [currentCondition.feelsLikeC wmh_stringTemperature];
    displayData.feelsLikeF = [currentCondition.feelsLikeF wmh_stringTemperature];
    displayData.humidity = [NSString stringWithFormat:@"%.2f",[currentCondition.humidity floatValue]];
    displayData.observationTime = currentCondition.observationTime;
    displayData.weatherDescription = [currentCondition.weatherDescription description];
    displayData.hourlyConditions = [self hourlyDisplayDataFromHourlyConditions:currentCondition.hourlyConditions];
    
    return displayData;
}

- (ForecastHourlyConditionDisplayData *)hourlyConditionDisplayDataFromHourlyCondition:(ForecastHourlyCondition *)hourlyCondition {
    ForecastHourlyConditionDisplayData *displayData = [[ForecastHourlyConditionDisplayData alloc] init];
    
    displayData.tempC = [hourlyCondition.tempC wmh_stringTemperature];
    displayData.tempF = [hourlyCondition.tempF wmh_stringTemperature];
    displayData.chanceOfRain = [NSString stringWithFormat:@"%.1f",[hourlyCondition.chanceOfRain floatValue]];
    
    return displayData;
}

- (NSArray <ForecastHourlyConditionDisplayData *> *)hourlyDisplayDataFromHourlyConditions:(NSArray <ForecastHourlyCondition *> *)hourlyConditions {
    NSMutableArray *hourlyConditionDisplayData = [[NSMutableArray alloc] initWithCapacity:hourlyConditions.count];
    for (ForecastHourlyCondition *hourlyCondition in hourlyConditions) {
        [hourlyConditionDisplayData addObject:[self hourlyConditionDisplayDataFromHourlyCondition:hourlyCondition]];
    }
    return [NSArray arrayWithArray:hourlyConditionDisplayData];
}


#pragma mark - Public

- (void)collectCurrentCondition:(ForecastCurrentCondition *)currentCondition {
    self.currentCondition = [self currentConditionDisplayDataFromCurrentCondition:currentCondition];
}

- (void)collectUpcomingConditions:(NSArray <ForecastUpcomingCondition *> *)upcomingConditions {
    self.upcomingConditions = [[NSMutableArray alloc] initWithCapacity:upcomingConditions.count];
    for (ForecastUpcomingCondition * upcomingCondition in upcomingConditions) {
        [self collectUpcomingCondition:upcomingCondition];
    }
}

- (ForecastDisplayData *)collectedData {
    return [[ForecastDisplayData alloc] initWithCurrentCondition:self.currentCondition upcomingConditions:self.upcomingConditions];
    
}

@end
