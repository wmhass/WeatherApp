//
//  ForecastDataManager.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastDataManagerParameters.h"

@class Forecast, City;
typedef void(^ForecastDataManagerForecastCompletionBlock)(Forecast *forecast, NSError *error);
typedef void(^ForecastDataManagerCitySearchCompletionBlock)(NSArray <City *> * cities, NSError *error);

@interface ForecastDataManager : NSObject

- (void)fetchForecastRemoteInformationWithParameters:(ForecastDataManagerParameters * )parameters withCompletion:(ForecastDataManagerForecastCompletionBlock)completionBlock;

- (void)fetchCitiesWithSearch:(NSString * )cityName withCompletion:(ForecastDataManagerCitySearchCompletionBlock)completionBlock;

@end