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

- (void)viewWillAppear {
    NSArray <City *> *cities = [self.savedCitiesInteractor savedCities];
    if (cities.count == 0) {
        [self.savedCitiesView presentEmptySavedCities];
    } else {
        [self makeViewDisplayCities:cities];
    }
    [self.savedCitiesView reloadAllData];
}

- (void)didSelectCityDisplay:(CityDisplayData * )cityDisplayData {
    [self.delegate savedCitiesPresenter:self didSelectCityDisplay:cityDisplayData];
    [self.savedCitiesWireframe closeView];
}

- (void)didTapCloseButton {
    [self.savedCitiesWireframe closeView];
}

#pragma mark - Private

- (void)makeViewDisplayCities:(NSArray <City *> * )cities {
    CityDisplayDataCollector *dataCollector = [[CityDisplayDataCollector alloc] init];
    [dataCollector collectCities:cities];
    [self.savedCitiesView displayCitiesList:[dataCollector collectedData]];
}

@end
