//
//  CitiesListDisplayData.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "CitiesListDisplayData.h"
#import "CityDisplayData.h"

@interface CitiesListDisplayData()

@property (strong, nonatomic) NSMutableArray <CityDisplayData *> *citiesDisplay;

@end

@implementation CitiesListDisplayData

#pragma mark - Intializers

- (id )initWithCitiesDisplayData:(NSArray <CityDisplayData *> *)citiesDisplayData {
    self = [super init];
    if (self) {
        _citiesDisplay = [citiesDisplayData mutableCopy];
    }
    return self;
}


#pragma mark - Public

- (CityDisplayData * )cityDisplayDataAtIndex:(NSInteger)index {
    return self.citiesDisplay[index];
}

- (NSInteger)numberOfCities {
    return self.citiesDisplay.count;
}

- (void)addCityDisplayData:(CityDisplayData * )cityDisplaydata {
    [self.citiesDisplay addObject:cityDisplaydata];
}

@end
