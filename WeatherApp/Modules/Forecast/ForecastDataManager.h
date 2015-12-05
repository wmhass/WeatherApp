//
//  ForecastDataManager.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastDataManagerParameters.h"

typedef void(^ForecastDataManagerCompletionBlock)(NSDictionary * _Nullable response, NSError * _Nullable error);

@interface ForecastDataManager : NSObject

- (void)fetchForecastRemoteInformationWithParameters:(ForecastDataManagerParameters * _Nonnull)parameters withCompletion:(ForecastDataManagerCompletionBlock _Nullable)completionBlock;

- (void)fetchCitiesWithSearch:(NSString * _Nonnull)cityName withCompletion:(ForecastDataManagerCompletionBlock _Nullable)completionBlock;

@end