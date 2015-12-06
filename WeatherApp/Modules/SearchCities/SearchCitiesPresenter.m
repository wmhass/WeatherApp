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

@interface SearchCitiesPresenter()

@property (strong, nonatomic) NSTimer * _Nullable searchTimer;

@end

@implementation SearchCitiesPresenter


#pragma mark - Public

- (void)fetchCitiesWithSearchString:(NSString * _Nullable)searchString {

    [self.searchTimer invalidate];
    
    if (searchString.length == 0) {
        return [self.searchCitiesView presentEmptySearchTextMessage];
    }

    self.searchTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(searchTimerFinished:) userInfo:searchString repeats:NO];
    
}

- (void)searchTimerFinished:(NSTimer *)timer {
    [self.searchCitiesInteractor searchCitiesWithSearchString:timer.userInfo];
}

- (void)didSelectCityDisplayData:(CityDisplayData *)cityDisplayData {
    [self.delegate searchCitiesPresenter:self didSelectCityDisplayData:cityDisplayData];
}

#pragma mark - Private

- (void)makeViewDisplayCities:(NSArray <City *> * _Nonnull)cities {
    CityDisplayDataCollector *dataCollector = [[CityDisplayDataCollector alloc] init];
    [dataCollector collectCities:cities];
    
    [self.searchCitiesView displayData:[dataCollector collectedData]];
    [self.searchCitiesView reloadAllData];
}


#pragma mark - SearchCitiesInteractorDelegate

- (void)searchCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFetchCities:(NSArray <City *> * _Nonnull)cities {
    
    if (cities.count == 0) {
        [self.searchCitiesView displayNoCitiesFound];
    } else {
        [self makeViewDisplayCities:cities];
    }
    
}


- (void)searchCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFailFetchingCitiesWithError:(NSError * _Nonnull)error {
    [self.searchCitiesView presentErrorMessage:error.localizedDescription];
}

@end
