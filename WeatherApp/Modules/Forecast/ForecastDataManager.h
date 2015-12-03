//
//  ForecastDataManager.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ForecastDataManagerCompletionBlock)(void);

@interface ForecastDataManager : NSObject

- (void)fetchForecastRemoteInformationForCity:(NSString *)cityName withCompletion:(ForecastDataManagerCompletionBlock)completionBlock;

@end