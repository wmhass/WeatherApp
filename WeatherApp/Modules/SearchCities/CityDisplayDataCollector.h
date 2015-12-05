//
//  CityDisplayDataCollector.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City, CitiesListDisplayData;
@interface CityDisplayDataCollector : NSObject

- (void)collectCities:(NSArray <City *> * _Nonnull)cities;
- (CitiesListDisplayData * _Nullable)collectedData;

@end
