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
#import "SavedCitiesInteractor.h"
#import "CityDisplayData.h"

@interface SearchCitiesPresenter()

@property (strong, nonatomic) NSTimer *searchTimer;

@end

@implementation SearchCitiesPresenter


#pragma mark - Public

- (void)fetchCitiesWithSearchString:(NSString * )searchString {

    [self.searchTimer invalidate];
    
    if ([self searchStringIsEmpty:searchString]) {
        [self cleanViewData];
        return [self.searchCitiesView presentEmptySearchTextMessage];
    }

    [self.searchCitiesView presentLoadingContent];
    self.searchTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(searchTimerFinished:) userInfo:searchString repeats:NO];
    
}

- (void)searchTimerFinished:(NSTimer *)timer {
    [self.searchCitiesInteractor searchCitiesWithSearchString:timer.userInfo];
}

- (void)didSelectCityDisplayData:(CityDisplayData *)cityDisplayData {
    City *city = [self.savedCitiesInteractor storedCityWithModel:cityDisplayData.referencedModel];
    if (city) {
        cityDisplayData.referencedModel = city;
    }
    [self.delegate searchCitiesPresenter:self didSelectCityDisplayData:cityDisplayData];
}

#pragma mark - Private

- (void)cleanViewData {
    [self.searchCitiesView displayData:nil];
    [self.searchCitiesView reloadAllData];
}

- (BOOL)searchStringIsEmpty:(NSString *)searchString {
    return [searchString stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]].length == 0;
}

- (void)makeViewDisplayCities:(NSArray <City *> * )cities {
    CityDisplayDataCollector *dataCollector = [[CityDisplayDataCollector alloc] init];
    [dataCollector collectCities:cities];
    
    [self.searchCitiesView displayData:[dataCollector collectedData]];
    [self.searchCitiesView reloadAllData];
}


#pragma mark - SearchCitiesInteractorDelegate

- (void)searchCitiesInteractor:(SearchCitiesInteractor * )interactor didFetchCities:(NSArray <City *> * )cities {
    
    if (cities.count == 0) {
        [self.searchCitiesView displayNoCitiesFoundMessage];
    } else {
        [self makeViewDisplayCities:cities];
    }
    
}


- (void)searchCitiesInteractor:(SearchCitiesInteractor * )interactor didFailFetchingCitiesWithError:(NSError * )error {
    [self.searchCitiesView presentErrorMessage:error.localizedDescription];
}

@end
