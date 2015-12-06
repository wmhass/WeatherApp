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

@property (strong, nonatomic) NSMutableArray <CityDisplayData *> * _Nullable citiesDisplayData;

@end

@implementation CityDisplayDataCollector

#pragma mark - Private

- (void)collectCity:(City *)city saved:(BOOL)saved {
    [self.citiesDisplayData addObject:[self cityDisplayDataFromCity:city saved:saved]];
}

- (CityDisplayData *)cityDisplayDataFromCity:(City *)city saved:(BOOL)saved {
    CityDisplayData *displayData = [[CityDisplayData alloc] init];
    
    displayData.city = city.city;
    displayData.region = city.region;
    displayData.country = city.country;
    displayData.latitude = city.latitude;
    displayData.longitude = city.longitude;
    displayData.referencedModel = city;
    displayData.stored = saved;
    return displayData;
}

- (void)collectCities:(NSArray <City *> * _Nonnull)cities saved:(BOOL)saved {
    self.citiesDisplayData = [[NSMutableArray alloc] initWithCapacity:cities.count];
    for (City * city in cities) {
        [self collectCity:city saved:saved];
    }
}


#pragma mark - Public

- (void)collectCities:(NSArray <City *> * _Nonnull)cities {
    [self collectCities:cities saved:NO];
}

- (void)collectSavedCities:(NSArray <City *> * _Nonnull)cities {
    [self collectCities:cities saved:YES];
}

- (CitiesListDisplayData * _Nullable)collectedData {
    if (!self.citiesDisplayData) {
        return nil;
    }
    return [[CitiesListDisplayData alloc] initWithCitiesDisplayData:self.citiesDisplayData];
}

@end