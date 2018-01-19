//
//  ForecastDisplayDataCollector.m
//  WeatherApp
//
//  Created by William Hass on 12/4/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDisplayDataCollector.h"
#import "ForecastCurrentCondition.h"
#import "ForecastCurrentConditionDisplayData.h"
#import "ForecastUpcomingCondition.h"
#import "ForecastUpcomingConditionDisplayData.h"
#import "ForecastHourlyCondition.h"
#import "ForecastHourlyConditionDisplayData.h"
#import "NSNumber+TemperatureFormatter.h"

@interface ForecastDisplayDataCollector()

@property (strong, nonatomic) ForecastCurrentConditionDisplayData *currentCondition;
@property (strong, nonatomic) NSMutableArray <ForecastUpcomingConditionDisplayData *> * upcomingConditions;
@property (nonatomic) ForecastDisplayDataTemperatureMetric collectingMetric;

@end

@implementation ForecastDisplayDataCollector

#pragma mark - Public 

- (id )initWithTemperatureMetric:(ForecastDisplayDataTemperatureMetric)metric {
    self = [super init];
    if(self) {
        _collectingMetric = metric;
    }
    return self;
}


#pragma mark - Private

- (BOOL)isCollectingFarenheit {
    return self.collectingMetric == ForecastDisplayDataTemperatureFarenheitMetric;
}

- (void)collectUpcomingCondition:(ForecastUpcomingCondition *)upcomingCondition {
    [self.upcomingConditions addObject:[self upcomingDisplayDataWithUpcomingContidion:upcomingCondition]];
}

- (ForecastUpcomingConditionDisplayData *)upcomingDisplayDataWithUpcomingContidion:(ForecastUpcomingCondition *)upcomingCondition {
    ForecastUpcomingConditionDisplayData *displayData = [[ForecastUpcomingConditionDisplayData alloc] init];
    
    if ([self isCollectingFarenheit]) {
        displayData.maxTemp = [upcomingCondition.maxTempF wmh_stringTemperature];
        displayData.minTemp = [upcomingCondition.minTempF wmh_stringTemperature];
    } else {
        displayData.maxTemp = [upcomingCondition.maxTempC wmh_stringTemperature];
        displayData.minTemp = [upcomingCondition.minTempC wmh_stringTemperature];
    }

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEE";
    displayData.weekDayName = [dateFormatter stringFromDate:upcomingCondition.date];
    
    return displayData;
}

- (ForecastCurrentConditionDisplayData *)currentConditionDisplayDataFromCurrentCondition:(ForecastCurrentCondition *)currentCondition {
    
    ForecastCurrentConditionDisplayData *displayData = [[ForecastCurrentConditionDisplayData alloc] init];
    
    if ([self isCollectingFarenheit]) {
        displayData.temp = [currentCondition.tempF wmh_stringTemperature];
        displayData.feelsLike = [currentCondition.feelsLikeF wmh_stringTemperature];
    } else {
        displayData.temp = [currentCondition.tempC wmh_stringTemperature];
        displayData.feelsLike = [currentCondition.feelsLikeC wmh_stringTemperature];
    }

    displayData.humidity = [NSString stringWithFormat:@"%.2f",[currentCondition.humidity floatValue]];
    displayData.observationTime = currentCondition.observationTime;
    displayData.weatherDescription = [currentCondition.weatherDescription description];
    displayData.hourlyConditions = [self hourlyDisplayDataFromHourlyConditions:currentCondition.hourlyConditions];
    
    return displayData;
}

- (ForecastHourlyConditionDisplayData *)hourlyConditionDisplayDataFromHourlyCondition:(ForecastHourlyCondition *)hourlyCondition {
    ForecastHourlyConditionDisplayData *displayData = [[ForecastHourlyConditionDisplayData alloc] init];
    
    if ([self isCollectingFarenheit]) {
        displayData.temp = [hourlyCondition.tempF wmh_stringTemperature];
    } else {
        displayData.temp = [hourlyCondition.tempC wmh_stringTemperature];
    }
    displayData.chanceOfRain = [NSString stringWithFormat:@"%.1f",[hourlyCondition.chanceOfRain floatValue]];
    displayData.time = hourlyCondition.time;
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

- (void)collectCurrentCondition:(ForecastCurrentCondition * )currentCondition {
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
