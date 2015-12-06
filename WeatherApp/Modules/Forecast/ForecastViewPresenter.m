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
#import "SearchCitiesViewWireframe.h"
#import "SearchCitiesPresenter.h"
#import "SearchCitiesViewController.h"
#import "CitiesListDisplayData.h"

@interface ForecastViewPresenter() <SearchCitiesInteractorDelegate, SearchCitiesPresenterDelegate>

@property (strong, nonatomic) SearchCitiesInteractor * _Nonnull searchCitiesInteractor;
@property (weak, nonatomic) SearchCitiesPresenter * _Nullable searchCitiesPresenter;

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


#pragma mark - Public (Presenter Actions)

- (void)doInitialLoad {
    [self reloadViewData];
}

- (void)reloadViewData {
    // If we can get the cities, we load the forecast, otherwise we present an empty state
    [self.searchCitiesInteractor loadSavedCities];
}

- (BOOL)canStartSearchingCity {
    SearchCitiesViewWireframe *searchWireframe = [[SearchCitiesViewWireframe alloc] init];
    SearchCitiesViewController *searchView = [searchWireframe searchCitiesViewController];
    [self.forecastView presentSearchCitiesView:searchView];
    
    [self holdSearchPresenter:searchView.presenter];
    
    return YES;
}

- (void)cancelCitySearch {
    [self.forecastView dismissSearchCitiesView];
}

- (void)citySearchTextChanged {
    [self.searchCitiesPresenter fetchCitiesWithSearchString:[self.forecastView searchingCityString]];
}

- (void)saveCity {
    CityDisplayData *selectedCity = [self.forecastView presentingCity];
    if(selectedCity.saved) { return ; }
    selectedCity.saved = [self.searchCitiesInteractor storeCity:selectedCity.referencedModel];
    [self.forecastView displayCity:selectedCity];
}

- (void)removeCity {
    CityDisplayData *selectedCity = [self.forecastView presentingCity];
    if(!selectedCity.saved) { return; }
    selectedCity.saved = ![self.searchCitiesInteractor removeCity:selectedCity.referencedModel];
    [self.forecastView displayCity:selectedCity];
}

#pragma mark - Private

- (void)holdSearchPresenter:(SearchCitiesPresenter *)presenter {
    presenter.delegate = self;
    self.searchCitiesPresenter = presenter;
}

- (ForecastDisplayData * _Nonnull)forecastDisplayDataFromForecast:(Forecast * _Nonnull)forecast {
    
    ForecastDisplayDataCollector *collector = [[ForecastDisplayDataCollector alloc] initWithTemperatureMetric:[self selectedMetric]];

    [collector collectCurrentCondition:forecast.currentCondition];
    [collector collectUpcomingConditions:forecast.upcomingConditions];
    
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
    CitiesListDisplayData *citiesList = [dataCollector collectedData];

    if ([citiesList numberOfCities] > 0) {
        CityDisplayData *firstCity = [citiesList cityDisplayDataAtIndex:0];
        [self.forecastView displayCity:firstCity];
        [self.forecastInteractor loadForecastForLatitude:firstCity.latitude longitude:firstCity.longitude];
    } else {
        // TODO: Hmm, what else can we do?
    }
    
}

- (void)searchCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFailFetchingCitiesWithError:(NSError * _Nonnull)error {
    [self.forecastView presentNoCitiesFoundMessage:error.localizedDescription];
}

#pragma mark - SearchCitiesPresenterDelegate

- (void)searchCitiesPresenter:(SearchCitiesPresenter * _Nonnull)presenter didSelectCityDisplayData:(CityDisplayData * _Nonnull)cityDisplayData {
    
    [self.forecastInteractor loadForecastForLatitude:cityDisplayData.latitude longitude:cityDisplayData.longitude];
    [self.forecastView displayCity:cityDisplayData];
    [self.forecastView dismissSearchCitiesView];
    
}

@end