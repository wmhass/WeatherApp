//
//  ForecastViewPresenter.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewPresenter.h"
#import "ForecastViewController.h"
#import "ForecastViewWireframe.h"
#import "ForecastViewInteractor.h"
#import "ForecastDisplayDataCollector.h"
#import "ForecastDisplayData.h"
#import "Forecast.h"

@interface ForecastViewPresenter()

@end

@implementation ForecastViewPresenter

#pragma mark - Presenter Actions

- (void)doInitialLoad {
    [self reloadViewData];
}

- (void)reloadViewData {
    [self.forecastInteractor forecastForCity:[self.forecastView searchingCity]];
}


#pragma mark - Private

- (ForecastDisplayData * _Nonnull)forecastDisplayDataFromForecast:(Forecast * _Nonnull)forecast {
    ForecastDisplayDataCollector *collector = [[ForecastDisplayDataCollector alloc] init];

    [collector collectCurrentCondition:forecast.currentCondition];
    [collector collectUpcomingConditions:forecast.upcomingConditions];
    [collector collectLocationName:forecast.locationName];
    
    return [collector collectedData];
}




#pragma mark - ForecastViewInteractorDelegate

- (void)forecastViewInteractor:(ForecastViewInteractor * _Nonnull)interactor didFetchForecast:(Forecast *  _Nonnull)forecast {
    [self.forecastView displayData:[self forecastDisplayDataFromForecast:forecast]];
    [self.forecastView reloadAllData];
}

- (void)forecastViewInteractor:(ForecastViewInteractor * _Nonnull)interactor didFailFetchingForecastWithError:(NSError * _Nonnull)error {
    [self.forecastView presentErrorMessage:error.localizedDescription];
}



@end
