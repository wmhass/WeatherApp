//
//  ForecastDataManager.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastDataManagerParameters.h"

typedef void(^ForecastDataManagerCompletionBlock)(NSDictionary *  response, NSError *  error);

@interface ForecastDataManager : NSObject

- (void)fetchForecastRemoteInformationWithParameters:(ForecastDataManagerParameters * )parameters withCompletion:(ForecastDataManagerCompletionBlock )completionBlock;

- (void)fetchCitiesWithSearch:(NSString * )cityName withCompletion:(ForecastDataManagerCompletionBlock )completionBlock;

@end