//
//  CityDisplayDataCollector.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "CityDisplayDataCollector.h"
#import "City.h"
#import "CityDisplayData.h"
#import "CitiesListDisplayData.h"

@interface CityDisplayDataCollector()

@property (strong, nonatomic) NSMutableArray <CityDisplayData *> *citiesDisplayData;

@end

@implementation CityDisplayDataCollector

#pragma mark - Private

- (void)collectCity:(City *)city {
    [self.citiesDisplayData addObject:[[CityDisplayData alloc] initWithCity:city]];
}

#pragma mark - Public

- (void)collectCities:(NSArray <City *> *)cities {
    self.citiesDisplayData = [[NSMutableArray alloc] initWithCapacity:cities.count];
    for (City * city in cities) {
        [self collectCity:city];
    }
}

- (CitiesListDisplayData * )collectedData {
    return [[CitiesListDisplayData alloc] initWithCitiesDisplayData:self.citiesDisplayData];
}

@end