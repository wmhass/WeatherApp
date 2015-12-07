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

- (NSMutableArray <City *> *)storedCities {
    static NSMutableArray <City *> * storedCities;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        storedCities = [[self.dataManager loadStoredCities] mutableCopy] ?: [NSMutableArray new];
    });
    return storedCities;
}

#pragma mark - Public

- (NSArray <City *> * )savedCities {
    return [NSArray arrayWithArray:[self storedCities]];
}

- (BOOL)storeCity:(City * )city {
    NSMutableArray *savedCities = [self storedCities];
    [savedCities addObject:city];
    if ([self.dataManager storeCities:savedCities]) {
        city.saved = YES;
        return YES;
    }
    return NO;
}

- (BOOL)removeCity:(City * )city {
    NSMutableArray *savedCities = [self storedCities];
    [savedCities removeObject:city];
    if ([self.dataManager storeCities:savedCities]) {
        city.saved = NO;
        return YES;
    }
    return NO;
}

- (City *)storedCityWithModel:(City *)city {
    for (City *storedCity in [self savedCities]) {
        if ([storedCity isEqual:city]) {
            return storedCity;
        }
    }
    return nil;
}

@end
