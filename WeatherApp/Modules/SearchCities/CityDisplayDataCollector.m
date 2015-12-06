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

- (void)collectCity:(City *)city {
    [self.citiesDisplayData addObject:[self cityDisplayDataFromCity:city]];
}

- (CityDisplayData *)cityDisplayDataFromCity:(City *)city {
    CityDisplayData *displayData = [[CityDisplayData alloc] init];
    
    displayData.city = city.city;
    displayData.region = city.region;
    displayData.country = city.country;
    displayData.latitude = city.latitude;
    displayData.longitude = city.longitude;
    displayData.referencedModel = city;
    displayData.saved = city.saved;
    return displayData;
}


#pragma mark - Public

- (void)collectCities:(NSArray <City *> * _Nonnull)cities {
    self.citiesDisplayData = [[NSMutableArray alloc] initWithCapacity:cities.count];
    for (City * city in cities) {
        [self collectCity:city];
    }
}

- (CitiesListDisplayData * _Nullable)collectedData {
    if (!self.citiesDisplayData) {
        return nil;
    }
    return [[CitiesListDisplayData alloc] initWithCitiesDisplayData:self.citiesDisplayData];
}

@end