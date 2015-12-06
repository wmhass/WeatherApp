//
//  SavedCitiesInteractor.h
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;
@interface SavedCitiesInteractor : NSObject

- (NSArray <City *> * _Nullable)loadSavedCities;
- (BOOL)storeCity:(City * _Nonnull)city;
- (BOOL)removeCity:(City * _Nonnull)city;

@end
