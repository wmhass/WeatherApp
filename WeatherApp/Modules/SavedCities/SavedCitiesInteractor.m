//
//  SavedCitiesInteractor.m
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SavedCitiesInteractor.h"
#import "City.h"
#import "SavedCitiesDataManager.h"

@implementation SavedCitiesInteractor

#pragma mark - Private

- (NSMutableArray <City *> *  )storedCities {
    static NSMutableArray <City *> * storedCities;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SavedCitiesDataManager *dataManager = [[SavedCitiesDataManager alloc] init];
        storedCities = [[dataManager loadStoredCities] mutableCopy] ?: [NSMutableArray new];
    });
    return storedCities;
}

#pragma mark - Public

- (NSArray <City *> * )loadSavedCities {
    return [NSArray arrayWithArray:[self storedCities]];
}

- (BOOL)storeCity:(City * )city {
    NSMutableArray *savedCities = [self storedCities];
    [savedCities addObject:city];
    return [[[SavedCitiesDataManager alloc] init] storeCities:savedCities];
}

- (BOOL)removeCity:(City * )city {
    NSMutableArray *savedCities = [self storedCities];
    [savedCities removeObject:city];
    return [[[SavedCitiesDataManager alloc] init] storeCities:savedCities];
}

@end
