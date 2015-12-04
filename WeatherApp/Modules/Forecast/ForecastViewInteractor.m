//
//  ForecastViewInteractor.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewInteractor.h"
#import "ForecastDataManager.h"
#import "ForecastCurrentCondition.h"
#import "ForecastUpcomingCondition.h"
#import "Forecast.h"
#import "ForecastHourlyCondition.h"

@implementation ForecastViewInteractor


#pragma mark - Public 

- (void)forecastForCity:(NSString *)cityName {
    
    ForecastDataManager *manager = [[ForecastDataManager alloc] init];
    ForecastDataManagerParameters *parameters = [[ForecastDataManagerParameters alloc] initWithCityName:cityName numberOfDays:@(5)];
    
    __weak ForecastViewInteractor *weakSelf = self;
    [manager fetchForecastRemoteInformationWithParameters:parameters withCompletion:^(NSDictionary * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            [weakSelf.delegate forecastViewInteractor:weakSelf didFailFetchingForecastWithError:error];
        } else {
            [weakSelf.delegate forecastViewInteractor:weakSelf didFetchForecast:[ForecastViewInteractor forecastFromDictionary:response]];
        }
        
    }];
}

+ (Forecast * _Nonnull)forecastFromDictionary:(NSDictionary * _Nonnull)dictionary {
    
    ForecastCurrentCondition *currentCondition = [ForecastViewInteractor forecastCurrentConditionFromDictionary:dictionary];
    
    NSArray <ForecastUpcomingCondition *> *upcomingConditions = [ForecastViewInteractor forecastUpcomingConditionsWithDictionary:dictionary];
    
    return [[Forecast alloc] initWithCurrentCondition:currentCondition upcomingConditions:upcomingConditions];
}

+ (NSArray <ForecastUpcomingCondition *> *)forecastUpcomingConditionsWithDictionary:(NSDictionary *)dictionary {
    NSMutableArray <ForecastUpcomingCondition *> *upcomingConditions = [@[] mutableCopy];
    
    NSArray *weather = dictionary[@"weather"];

    // The first item of the array is actually the current day, so we skip it
    NSArray *upcomingWeather = [weather subarrayWithRange:NSMakeRange(1, weather.count-1)];
    for (NSDictionary *upcomingCondition in upcomingWeather) {
        [upcomingConditions addObject:[[ForecastUpcomingCondition alloc] initWithDictionary:upcomingCondition]];
    }

    return [NSArray arrayWithArray:upcomingConditions];
}

+ (ForecastCurrentCondition * _Nonnull)forecastCurrentConditionFromDictionary:(NSDictionary *)dictionary {

    NSMutableArray <ForecastHourlyCondition *> *hourlyConditions = [@[] mutableCopy];
    
    NSDictionary *currentWeather = [dictionary[@"weather"] firstObject];
    for (NSDictionary *hourlyCondition in currentWeather[@"hourly"]) {
        [hourlyConditions addObject:[[ForecastHourlyCondition alloc] initWithDictionary:hourlyCondition]];
    }
    
    ForecastCurrentCondition *currentCondition = [[ForecastCurrentCondition alloc] initWithDictionary:[dictionary[@"current_condition"] firstObject]];
    currentCondition.hourlyConditions = [NSArray arrayWithArray:hourlyConditions];

    return currentCondition;
}

@end
