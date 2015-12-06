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

static NSInteger const ForecastViewInteractorNumberOfDays = 5;

@implementation ForecastViewInteractor


#pragma mark - Public 

- (void)loadForecastForLatitude:(NSString *  )latitude longitude:(NSString *)longitude {
    
    ForecastDataManager *manager = [[ForecastDataManager alloc] init];
    ForecastDataManagerParameters *parameters = [[ForecastDataManagerParameters alloc] init];
    parameters.numberOfDays = @(ForecastViewInteractorNumberOfDays);
    parameters.latitude = latitude;
    parameters.longitude = longitude;
    
    __weak ForecastViewInteractor *weakSelf = self;
    [manager fetchForecastRemoteInformationWithParameters:parameters withCompletion:^(NSDictionary *  response, NSError *  error) {
        
        if (error) {
            [weakSelf.delegate forecastViewInteractor:weakSelf didFailFetchingForecastWithError:error];
        } else {
            [weakSelf.delegate forecastViewInteractor:weakSelf didFetchForecast:[weakSelf forecastFromDictionary:response]];
        }
        
    }];
}

- (Forecast * )forecastFromDictionary:(NSDictionary * )dictionary {
    
    ForecastCurrentCondition *currentCondition = [self forecastCurrentConditionFromDictionary:dictionary];
    
    NSArray <ForecastUpcomingCondition *> *upcomingConditions = [self forecastUpcomingConditionsWithDictionary:dictionary];
    
    return [[Forecast alloc] initWithCurrentCondition:currentCondition upcomingConditions:upcomingConditions];
}

- (NSArray <ForecastUpcomingCondition *> * )forecastUpcomingConditionsWithDictionary:(NSDictionary * )dictionary {
    NSMutableArray <ForecastUpcomingCondition *> *upcomingConditions = [@[] mutableCopy];
    
    NSArray *weather = dictionary[@"weather"];

    // The first item of the array is actually the current day, so we skip it
    NSArray *upcomingWeather = [weather subarrayWithRange:NSMakeRange(1, weather.count-1)];
    for (NSDictionary *upcomingCondition in upcomingWeather) {
        [upcomingConditions addObject:[[ForecastUpcomingCondition alloc] initWithDictionary:upcomingCondition]];
    }

    return [NSArray arrayWithArray:upcomingConditions];
}

- (ForecastCurrentCondition * )forecastCurrentConditionFromDictionary:(NSDictionary * )dictionary {

    NSMutableArray <ForecastHourlyCondition *> *hourlyConditions = [@[] mutableCopy];
    for (NSDictionary *hourlyCondition in dictionary[@"weather"][0][@"hourly"]) {
        [hourlyConditions addObject:[[ForecastHourlyCondition alloc] initWithDictionary:hourlyCondition]];
    }
    
    ForecastCurrentCondition *currentCondition = [[ForecastCurrentCondition alloc] initWithDictionary:[dictionary[@"current_condition"] firstObject]];
    currentCondition.hourlyConditions = [NSArray arrayWithArray:hourlyConditions];

    return currentCondition;
}

@end
