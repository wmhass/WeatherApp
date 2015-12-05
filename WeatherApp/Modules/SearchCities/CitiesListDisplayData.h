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

- (id _Nonnull)initWithCitiesDisplayData:(NSArray <CityDisplayData *> *_Nonnull)citiesDisplayData;

- (NSInteger)numberOfCities;
- (CityDisplayData * _Nonnull)cityDisplayDataAtIndex:(NSInteger)index;

@end
