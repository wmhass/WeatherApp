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

@property (strong, nonatomic) NSMutableArray <CityDisplayData *> * _Nonnull citiesDisplay;

@end

@implementation CitiesListDisplayData

#pragma mark - Intializers

- (id _Nonnull)initWithCitiesDisplayData:(NSArray <CityDisplayData *> *_Nonnull)citiesDisplayData {
    self = [super init];
    if (self) {
        _citiesDisplay = [citiesDisplayData mutableCopy];
    }
    return self;
}


#pragma mark - Public

- (CityDisplayData * _Nonnull)cityDisplayDataAtIndex:(NSInteger)index {
    return self.citiesDisplay[index];
}

- (NSInteger)numberOfCities {
    return self.citiesDisplay.count;
}

- (void)addCityDisplayData:(CityDisplayData * _Nonnull)cityDisplaydata {
    [self.citiesDisplay addObject:cityDisplaydata];
}

@end
