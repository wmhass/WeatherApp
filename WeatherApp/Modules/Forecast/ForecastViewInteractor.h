//
//  ForecastViewInteractor.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastViewInteractor, Forecast;
@protocol ForecastViewInteractorDelegate <NSObject>

- (void)forecastViewInteractor:(ForecastViewInteractor * _Nonnull)interactor didFetchForecast:(Forecast * _Nonnull)forecast;
- (void)forecastViewInteractor:(ForecastViewInteractor * _Nonnull)interactor didFailFetchingForecastWithError:(NSError * _Nonnull)error;

@end

@interface ForecastViewInteractor : NSObject

@property (weak, nonatomic) id<ForecastViewInteractorDelegate> _Nullable delegate;

- (void)loadForecastForLatitude:(NSString * _Nonnull)latitude longitude:(NSString * _Nonnull)longitude;

@end