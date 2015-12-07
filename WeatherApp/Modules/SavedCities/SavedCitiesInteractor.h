//
//  SavedCitiesInteractor.h
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City, SavedCitiesDataManager;
@interface SavedCitiesInteractor : NSObject

@property (strong, nonatomic) SavedCitiesDataManager *dataManager;

- (NSArray <City *> * )savedCities;
- (BOOL)storeCity:(City * )city;
- (BOOL)removeCity:(City * )city;
- (City *)storedCityWithModel:(City *)city;

@end
