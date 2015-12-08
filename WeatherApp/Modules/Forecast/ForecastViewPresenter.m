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

@interface ForecastViewPresenter() <SearchCitiesPresenterDelegate, SavedCitiesPresenterDelegate>

@property (weak, nonatomic) SearchCitiesPresenter *searchCitiesPresenter;

@end

@implementation ForecastViewPresenter


#pragma mark - Public (Presenter Actions)

- (void)viewWillAppear {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self doInitialDataLoad];
    });
}

- (void)metricValueChanged {
    [self updateUserInterfaceWithForecast:[self forecastDisplayDataFromForecast:self.forecastInteractor.cachedForecast]];
}

- (void)didStartTypingCitySearch {
    
    [self.forecastWireframe presentSearchViewInView:[self.forecastView viewForPresentingSearchController]];
    
    [self.forecastView presentSearchCitiesView];
    
    self.searchCitiesPresenter = self.forecastWireframe.searchCitiesWireframe.presentingView.presenter;
    self.searchCitiesPresenter.delegate = self;
}

- (void)didTapCancelSearchButton {
    [self.forecastView dismissSearchCitiesView];
}

- (void)citySearchTextChanged {
    [self.searchCitiesPresenter fetchCitiesWithSearchString:[self.forecastView searchingCityString]];
}

- (void)didTapSaveCityButton {
    CityDisplayData *selectedCity = [self.forecastView presentingCity];
    if(selectedCity.saved) { return ; }
    [self.savedCitiesInteractor storeCity:selectedCity.referencedModel];
    [self.forecastView displayCity:selectedCity];
}

- (void)didTapRemoveCityButton {
    CityDisplayData *selectedCity = [self.forecastView presentingCity];
    if(!selectedCity.saved) { return; }
    [self.savedCitiesInteractor removeCity:selectedCity.referencedModel];
    [self.forecastView displayCity:selectedCity];
}

- (void)didTapMyCitiesButton {
    [self.forecastWireframe presentSavedCitiesViewWithDelegate:self];
}

#pragma mark - Private

- (void)doInitialDataLoad {
    NSArray *cities = [self.savedCitiesInteractor savedCities];
    
    if (cities.count > 0) {
        
        CityDisplayDataCollector *dataCollector = [[CityDisplayDataCollector alloc] init];
        [dataCollector collectCities:cities];
        CityDisplayData *firstCity = [[dataCollector collectedData] cityDisplayDataAtIndex:0];
        
        [self.forecastView displayCity:firstCity];
        [self refreshForecast];
        
    } else {
        [self.forecastView presentEmptySavedCities];
    }
}

- (void)refreshForecast {
    [self.forecastView showLoadingView];
    CityDisplayData *displayingCity = [self.forecastView presentingCity];
    [self.forecastInteractor loadForecastForLatitude:displayingCity.latitude longitude:displayingCity.longitude];
}

- (ForecastDisplayData * )forecastDisplayDataFromForecast:(Forecast * )forecast {
    ForecastDisplayDataCollector *collector = [[ForecastDisplayDataCollector alloc] initWithTemperatureMetric:[self.forecastView selectedMetric]];

    [collector collectCurrentCondition:forecast.currentCondition];
    [collector collectUpcomingConditions:forecast.upcomingConditions];
    
    return [collector collectedData];
}

- (void)updateUserInterfaceWithForecast:(ForecastDisplayData *)forecastDisplayData {
    [self.forecastView displayForecast:forecastDisplayData];
    [self.forecastView reloadAllData];
}

#pragma mark - ForecastViewInteractorDelegate

- (void)forecastViewInteractor:(ForecastViewInteractor * )interactor didFetchForecast:(Forecast *)forecast {
    [self updateUserInterfaceWithForecast:[self forecastDisplayDataFromForecast:forecast]];
    [self.forecastView hideLoadingView];
}

- (void)forecastViewInteractor:(ForecastViewInteractor * )interactor didFailFetchingForecastWithError:(NSError * )error {
    [self.forecastView presentErrorMessage:error.localizedDescription];
    [self.forecastView hideLoadingView];
}


#pragma mark - SearchCitiesPresenterDelegate

- (void)searchCitiesPresenter:(SearchCitiesPresenter * )presenter didSelectCityDisplayData:(CityDisplayData * )cityDisplayData {
    [self refreshForecast];
    [self.forecastView displayCity:cityDisplayData];

    [self.forecastView dismissSearchCitiesView];
}

#pragma mark - SavedCitiesPresenterDelegate

- (void)savedCitiesPresenter:(SavedCitiesPresenter *)presenter didSelectCityDisplay:(CityDisplayData *)cityDisplayData {
    [self refreshForecast];
    [self.forecastView displayCity:cityDisplayData];
}

@end