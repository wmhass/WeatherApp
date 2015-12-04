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
    [self.forecastWireframe didPresentSearchView:self.forecastView.searchCitiesController];
    [self reloadViewData];
    
}

- (void)reloadViewData {
    [self.forecastInteractor forecastForCity:[self.forecastView searchingCity]];
}


#pragma mark - Private

- (ForecastDisplayData *)forecastDisplayDataFromForecast:(Forecast *)forecast {
    ForecastDisplayDataCollector *collector = [[ForecastDisplayDataCollector alloc] init];

    [collector collectCurrentCondition:forecast.currentCondition];
    [collector collectUpcomingConditions:forecast.upcomingConditions];
    
    return [collector collectedData];
}




#pragma mark - ForecastViewInteractorDelegate

- (void)forecastViewInteractor:(ForecastViewInteractor *)interactor didFetchForecast:(Forecast *)forecast {
    [self.forecastView displayData:[self forecastDisplayDataFromForecast:forecast]];
}

- (void)forecastViewInteractor:(ForecastViewInteractor *)interactor didFailFetchingForecastWithError:(NSError *)error {
    [self.forecastView presentErrorMessage:error.localizedDescription];
}



@end
