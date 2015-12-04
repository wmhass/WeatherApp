//
//  ForecastViewInteractor.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastViewInteractor, Forecast;
@protocol ForecastViewInteractorDelegate

- (void)forecastViewInteractor:(ForecastViewInteractor *)interactor didFetchForecast:(Forecast *)forecast;
- (void)forecastViewInteractor:(ForecastViewInteractor *)interactor didFailFetchingForecastWithError:(NSError *)error;

@end

@interface ForecastViewInteractor : NSObject

@property (weak, nonatomic) id<ForecastViewInteractorDelegate> delegate;

- (void)forecastForCity:(NSString *)cityName;

@end