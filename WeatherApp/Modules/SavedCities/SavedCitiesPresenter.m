//
//  SavedCitiesPresenter.m
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SavedCitiesPresenter.h"
#import "SavedCitiesInteractor.h"
#import "CityDisplayDataCollector.h"
#import "SavedCitiesViewController.h"
#import "SavedCitiesWireframe.h"

@implementation SavedCitiesPresenter

#pragma mark - Public

- (void)loadData {
    NSArray <City *> *cities = [self.savedCitiesInteractor loadSavedCities];
    if (cities.count == 0) {
        [self.savedCitiesView presentEmptyContent];
    } else {
        [self makeViewDisplayCities:cities];
    }
    [self.savedCitiesView reloadAllData];
}

- (void)didSelectCityDisplay:(CityDisplayData * _Nonnull)cityDisplayData {
    // TODO: Tells delegate
    [self.savedCitiesWireframe closeView];
}

- (void)didTapCloseButton {
    [self.savedCitiesWireframe closeView];
}

#pragma mark - Private

- (void)makeViewDisplayCities:(NSArray <City *> * _Nonnull)cities {
    CityDisplayDataCollector *dataCollector = [[CityDisplayDataCollector alloc] init];
    [dataCollector collectCities:cities];
    [self.savedCitiesView displayData:[dataCollector collectedData]];
}

@end
