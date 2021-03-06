//
//  WorldWeatherDataManager.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "WorldWeatherDataManager.h"
#import "ForecastCurrentCondition.h"
#import "Forecast.h"
#import "ForecastUpcomingCondition.h"
#import "ForecastHourlyCondition.h"
#import "City.h"
#import <AFNetworking/AFNetworking.h>

NSString * const APIKey = @"b0c1ec953c664fbc91415306181901";
NSString * const APIURI = @"http://api.worldweatheronline.com/premium";
NSString * const APIVersion = @"v1";
NSString * const APIWeatherEndPoint = @"weather.ashx";
NSString * const APICitySearchEndPoint = @"search.ashx";
NSString * const APIResponsePrefferedFormat = @"json";

@implementation WorldWeatherDataManager

#pragma mark - Private

- (NSString * )URLForEndPoint:(NSString * )endpoint {
    return [@[APIURI, APIVersion, endpoint] componentsJoinedByString:@"/"];
}

- (NSDictionary * )parametersWithParameterObject:(WorldWeatherDataManagerParameters *)parameters {
    NSMutableDictionary *returnParameters = [@{@"format": APIResponsePrefferedFormat, @"key": APIKey} mutableCopy];

    if (parameters.cityName) {
        [returnParameters setObject:parameters.cityName forKey:@"q"];
    } else if (parameters.latitude.length > 0 && parameters.longitude > 0) {
        NSString *locationQuery = [NSString stringWithFormat:@"%@,%@",parameters.latitude, parameters.longitude];
        [returnParameters setObject:locationQuery forKey:@"q"];
    }
    
    if (parameters.numberOfDays) {
        [returnParameters setObject:parameters.numberOfDays forKey:@"num_of_days"];
    }
    
    return returnParameters;
}

- (NSString * )errorMessageForResponse:(NSDictionary * )responseObject {
    if (!responseObject) {
        return NSLocalizedString(@"REQUEST_ERROR_MESSAGE", @"No data recevied from the server");
    }
    return responseObject[@"data"][@"error"][0][@"mesg"];
}


- (NSError * )datamanagerErrorWithMessage:(NSString * )message {
    NSError *error = [[NSError alloc] initWithDomain:@"com.datamanager" code:0 userInfo:@{NSLocalizedDescriptionKey: message}];
    return error;
}

#pragma mark - Public

- (void)fetchForecastRemoteInformationWithParameters:(WorldWeatherDataManagerParameters *)parameters withCompletion:(WorldWeatherDataManagerForecastCompletionBlock)completionBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    __weak WorldWeatherDataManager *weakSelf = self;
    [manager GET:[self URLForEndPoint:APIWeatherEndPoint]
      parameters:[self parametersWithParameterObject:parameters]
         success:^(AFHTTPRequestOperation *operation, id   responseObject) {
             
             NSString *errorMessage = [weakSelf errorMessageForResponse:responseObject];
             
             if (errorMessage && completionBlock) {
                 completionBlock(nil, [weakSelf datamanagerErrorWithMessage:errorMessage]);
             } else  if(completionBlock) {
                 completionBlock([weakSelf forecastFromDictionary:responseObject[@"data"]],nil);
             }
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if (completionBlock) {
                 completionBlock(nil, [weakSelf datamanagerErrorWithMessage:error.localizedDescription]);
             }
         }];
}


- (void)fetchCitiesWithSearch:(NSString * )cityName withCompletion:(WorldWeatherDataManagerCitySearchCompletionBlock)completionBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    WorldWeatherDataManagerParameters *parameters = [[WorldWeatherDataManagerParameters alloc] init];
    parameters.cityName = cityName;
    
    __weak WorldWeatherDataManager *weakSelf = self;
    [manager GET:[self URLForEndPoint:APICitySearchEndPoint]
      parameters:[self parametersWithParameterObject:parameters]
         success:^(AFHTTPRequestOperation *operation, id   responseObject) {
             
             NSString *errorMessage = [weakSelf errorMessageForResponse:responseObject];
             
             if (errorMessage && completionBlock) {
                 completionBlock(nil, [weakSelf datamanagerErrorWithMessage:errorMessage]);
             } else  if(completionBlock) {
                 completionBlock([self citiesFromDictionary:responseObject[@"search_api"]], nil);
             }
             
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             if (completionBlock) {
                 completionBlock(nil, [weakSelf datamanagerErrorWithMessage:error.localizedDescription]);
             }
         }];
}

#pragma mark - Private

- (NSArray <City *> * )citiesFromDictionary:(NSDictionary * )dictionary {
    
    NSArray <NSDictionary *> * rawCities = dictionary[@"result"];
    
    NSMutableArray *cities = [[NSMutableArray alloc] initWithCapacity:rawCities.count];
    
    for (NSDictionary *rawCity in rawCities) {
        [cities addObject:[[City alloc] initWithDictionary:rawCity]];
    }
    
    return [NSArray arrayWithArray:cities];
}

- (Forecast * )forecastFromDictionary:(NSDictionary * )dictionary {
    
    ForecastCurrentCondition *currentCondition = [self forecastCurrentConditionFromDictionary:dictionary];
    
    NSArray <ForecastUpcomingCondition *> *upcomingConditions = [self forecastUpcomingConditionsWithDictionary:dictionary];
    
    return [[Forecast alloc] initWithCurrentCondition:currentCondition upcomingConditions:upcomingConditions];
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

@end
