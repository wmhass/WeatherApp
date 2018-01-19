//
//  SavedCitiesDataManager.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;
@interface SavedCitiesDataManager : NSObject

- (NSArray <City *> * )loadStoredCities;
- (BOOL)storeCities:(NSArray <City *> * )cities;

@end
