//
//  SearchCitiesPresenter.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SearchCitiesPresenter.h"
#import "CityDisplayDataCollector.h"
#import "SearchCitiesViewController.h"

@implementation SearchCitiesPresenter

#pragma mark - Public

- (void)fetchCities {
    NSString *searchString = [self.searchCitiesView searchingTerm];

    if (searchString.length == 0) {
        [self.searchCitiesView presentSearchEmptyMessage];
    } else {
        [self.searchCitiesInteractor searchCitiesWithSearchString:searchString];
    }
}


#pragma mark - SearchCitiesInteractorDelegate

- (void)serachCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFetchCities:(NSArray <City *> * _Nonnull)cities {
    CityDisplayDataCollector *dataCollector = [[CityDisplayDataCollector alloc] init];
    [dataCollector collectCities:cities];
    
    [self.searchCitiesView displayData:[dataCollector collectedData]];
    [self.searchCitiesView reloadAllData];
}


- (void)serachCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFailFetchingCitiesWithError:(NSError * _Nonnull)error {
    [self.searchCitiesView presentErrorMessage:error.localizedDescription];
}

@end
