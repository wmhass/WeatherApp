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

@property (strong, nonatomic) NSArray <CityDisplayData *> * _Nonnull citiesDisplay;

@end

@implementation CitiesListDisplayData

#pragma mark - Intializers

- (id _Nonnull)initWithCitiesDisplayData:(NSArray <CityDisplayData *> *_Nonnull)citiesDisplayData {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
