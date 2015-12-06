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
#import "CityDisplayDataCollector.h"
#import "SearchCitiesViewWireframe.h"
#import "SearchCitiesPresenter.h"
#import "SearchCitiesViewController.h"
#import "CitiesListDisplayData.h"
#import "SavedCitiesInteractor.h"
#import "SavedCitiesViewController.h"
#import "SavedCitiesPresenter.h"
#import "SavedCitiesWireframe.h"

@interface ForecastViewPresenter() <SearchCitiesPresenterDelegate, SavedCitiesPresenterDelegate>

@property (strong, nonatomic) SavedCitiesInteractor * _Nonnull savedCitiesInteractor;
@property (weak, nonatomic) SearchCitiesPresenter * _Nullable searchCitiesPresenter;

@end

@implementation ForecastViewPresenter


#pragma mark - Initializer

- (id)init {
    self = [super init];
    if (self) {
        _savedCitiesInteractor = [[SavedCitiesInteractor alloc] init];
    }
    return self;
}


#pragma mark - Public (Presenter Actions)

- (void)doInitialLoad {
    [self reloadViewData];
}

- (void)reloadViewData {

    NSArray *cities = [self.savedCitiesInteractor loadSavedCities];

    if (cities.count > 0) {
        
        CityDisplayDataCollector *dataCollector = [[CityDisplayDataCollector alloc] init];
        [dataCollector collectCities:cities];
        CityDisplayData *firstCity = [[dataCollector collectedData] cityDisplayDataAtIndex:0];
        
        [self.forecastView displayCity:firstCity];
        [self refreshForecast];

    } else {
        [self.forecastView presentNoCitiesFoundMessage:NSLocalizedString(@"NO_CITIES_MESSAGE", nil)];
    }
}

- (void)metricValueChanged {
    [self refreshForecast];
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
    selectedCity.saved = [self.savedCitiesInteractor storeCity:selectedCity.referencedModel];
    [self.forecastView displayCity:selectedCity];
}

- (void)removeCity {
    CityDisplayData *selectedCity = [self.forecastView presentingCity];
    if(!selectedCity.saved) { return; }
    selectedCity.saved = ![self.savedCitiesInteractor removeCity:selectedCity.referencedModel];
    [self.forecastView displayCity:selectedCity];
}

- (void)willPresentMyCitiesView:(SavedCitiesViewController * _Nonnull)viewController {
    viewController.presenter.delegate = self;
    [self.forecastWireframe willPresentSavedCitiesView:viewController];
}

#pragma mark - Private

- (void)refreshForecast {
    CityDisplayData *displayingCity = [self.forecastView presentingCity];
    [self.forecastInteractor loadForecastForLatitude:displayingCity.latitude longitude:displayingCity.longitude];
}

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


#pragma mark - SearchCitiesPresenterDelegate

- (void)searchCitiesPresenter:(SearchCitiesPresenter * _Nonnull)presenter didSelectCityDisplayData:(CityDisplayData * _Nonnull)cityDisplayData {
    
    [self.forecastView displayCity:cityDisplayData];
    [self refreshForecast];
    [self.forecastView dismissSearchCitiesView];
    
}

#pragma mark - SavedCitiesPresenterDelegate

- (void)savedCitiesPresenter:(SavedCitiesPresenter *)presenter didSelectCityDisplay:(CityDisplayData *)cityDisplayData {
    [self.forecastView displayCity:cityDisplayData];
    [self refreshForecast];
}

@end