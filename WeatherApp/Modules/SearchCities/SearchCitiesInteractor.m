//
//  SearchCitiesInteractor.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SearchCitiesInteractor.h"
#import "City.h"
#import "ForecastDataManager.h"
#import "SavedCitiesDataManager.h"

@implementation SearchCitiesInteractor

#pragma mark - Public 

- (void)searchCitiesWithSearchString:(NSString * )searchString {
    ForecastDataManager *dataManager = [[ForecastDataManager alloc] init];
    
    __weak SearchCitiesInteractor *weakSelf = self;
    [dataManager fetchCitiesWithSearch:searchString withCompletion:^(NSDictionary *  response, NSError *  error) {

        if (error) {
            [weakSelf.delegate searchCitiesInteractor:weakSelf didFailFetchingCitiesWithError:error];
        } else {
            [weakSelf.delegate searchCitiesInteractor:weakSelf didFetchCities:[weakSelf citiesFromDictionary:response]];
        }
        
    }];
}


#pragma mark - Private


- (NSArray <City *> * )citiesFromDictionary:(NSDictionary * )dictionary {
    
    NSArray <NSDictionary *> * rawCities = dictionary[@"result"];
    
    NSMutableArray *cities = [[NSMutableArray alloc] initWithCapacity:rawCities.count];
    
    for (NSDictionary *rawCity in rawCities) {
        [cities addObject:[[City alloc] initWithDictionary:rawCity]];
    }
    
    return [NSArray arrayWithArray:cities];
}


@end
