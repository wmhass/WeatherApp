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
    if ([[[SavedCitiesDataManager alloc] init] storeCities:savedCities]) {
        city.saved = YES;
        return YES;
    }
    return NO;
}

- (BOOL)removeCity:(City * )city {
    NSMutableArray *savedCities = [self storedCities];
    [savedCities removeObject:city];
    if ([[[SavedCitiesDataManager alloc] init] storeCities:savedCities]) {
        city.saved = NO;
        return YES;
    }
    return NO;
}

- (City *)storedCityWithModel:(City *)city {
    NSArray <City *> * cities = [self loadSavedCities];
    for (City *storedCity in cities) {
        if ([storedCity isEqual:city]) {
            return storedCity;
        }
    }
    return nil;
}

@end
