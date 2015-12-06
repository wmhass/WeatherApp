//
//  CitiesListDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CityDisplayData;
@interface CitiesListDisplayData : NSObject

- (id )initWithCitiesDisplayData:(NSArray <CityDisplayData *> *)citiesDisplayData;

- (NSInteger)numberOfCities;
- (CityDisplayData * )cityDisplayDataAtIndex:(NSInteger)index;
- (void)addCityDisplayData:(CityDisplayData * )cityDisplaydata;

@end
