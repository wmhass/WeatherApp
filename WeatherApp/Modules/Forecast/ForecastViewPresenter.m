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
#import "CityDisplayData.h"
#import "SearchCitiesInteractor.h"
#import "CityDisplayDataCollector.h"

@interface ForecastViewPresenter() <SearchCitiesInteractorDelegate>

@property (strong, nonatomic) SearchCitiesInteractor * _Nonnull searchCitiesInteractor;

@end

@implementation ForecastViewPresenter

#pragma mark - Initializer

- (id)init {
    self = [super init];
    if (self) {
        _searchCitiesInteractor = [[SearchCitiesInteractor alloc] init];
        _searchCitiesInteractor.delegate = self;
    }
    return self;
}


#pragma mark - Presenter Actions

- (void)doInitialLoad {
    [self reloadViewData];
}

- (void)reloadViewData {
    // If we could get the cities, we load the forecast, otherwise we present an error
    [self.searchCitiesInteractor loadSavedCities];
}


#pragma mark - Private

- (ForecastDisplayData * _Nonnull)forecastDisplayDataFromForecast:(Forecast * _Nonnull)forecast {
    
    ForecastDisplayDataCollector *collector = [[ForecastDisplayDataCollector alloc] initWithTemperatureMetric:[self selectedMetric]];

    [collector collectCurrentCondition:forecast.currentCondition];
    [collector collectUpcomingConditions:forecast.upcomingConditions];
    [collector collectLocationName:forecast.locationName];
    
    return [collector collectedData];
}

- (ForecastDisplayDataCollectorTemperatureMetric)selectedMetric {
    return (ForecastDisplayDataCollectorTemperatureMetric)[self.forecastView selectedMetric];
}


#pragma mark - ForecastViewInteractorDelegate

- (void)forecastViewInteractor:(ForecastViewInteractor * _Nonnull)interactor didFetchForecast:(Forecast *  _Nonnull)forecast {
    [self.forecastView displayForecastData:[self forecastDisplayDataFromForecast:forecast]];
    [self.forecastView reloadAllData];
}

- (void)forecastViewInteractor:(ForecastViewInteractor * _Nonnull)interactor didFailFetchingForecastWithError:(NSError * _Nonnull)error {
    [self.forecastView presentErrorMessage:error.localizedDescription];
}

#pragma mark - SearchCitiesInteractorDelegate

- (void)searchCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFetchCities:(NSArray <City *> * _Nonnull)cities {
    CityDisplayDataCollector *dataCollector = [[CityDisplayDataCollector alloc] init];
    [dataCollector collectCities:cities];
    [self.forecastView displayCities:[dataCollector collectedData]];

    CityDisplayData *selectedCity = [self.forecastView selectedCity];
    if (!selectedCity) {
        // TODO: Maybe try to obtain user's location ? Ot just ask view to present empty state
    } else {
        [self.forecastInteractor loadForecastForLatitude:selectedCity.latitude longitude:selectedCity.longitude];
    }
}

- (void)searchCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFailFetchingCitiesWithError:(NSError * _Nonnull)error {
    [self.forecastView presentNoCitiesFoundMessage:error.localizedDescription];
}



@end
