//
//  WorldWeatherDataManager.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WorldWeatherDataManagerParameters.h"

@class Forecast, City;
typedef void(^WorldWeatherDataManagerForecastCompletionBlock)(Forecast *forecast, NSError *error);
typedef void(^WorldWeatherDataManagerCitySearchCompletionBlock)(NSArray <City *> * cities, NSError *error);

@interface WorldWeatherDataManager : NSObject

- (void)fetchForecastRemoteInformationWithParameters:(WorldWeatherDataManagerParameters *)parameters withCompletion:(WorldWeatherDataManagerForecastCompletionBlock)completionBlock;

- (void)fetchCitiesWithSearch:(NSString * )cityName withCompletion:(WorldWeatherDataManagerCitySearchCompletionBlock)completionBlock;

@end