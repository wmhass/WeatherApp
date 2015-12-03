//
//  ForecastViewInteractor.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastViewInteractor;
@protocol ForecastViewInteractorDelegate

- (void)forecastViewInteractor:(ForecastViewInteractor *)interactor didFetchForecast:(NSArray *)forecast;

@end

@interface ForecastViewInteractor : NSObject

@property (weak, nonatomic) id<ForecastViewInteractorDelegate> delegate;

@end