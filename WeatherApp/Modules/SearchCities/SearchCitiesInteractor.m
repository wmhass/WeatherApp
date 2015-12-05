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

- (void)searchCitiesWithSearchString:(NSString * _Nonnull)searchString {
    ForecastDataManager *dataManager = [[ForecastDataManager alloc] init];
    
    __weak SearchCitiesInteractor *weakSelf = self;
    [dataManager fetchCitiesWithSearch:searchString withCompletion:^(NSDictionary * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            [weakSelf.delegate searchCitiesInteractor:weakSelf didFailFetchingCitiesWithError:error];
        } else {
            [weakSelf.delegate searchCitiesInteractor:weakSelf didFetchCities:[weakSelf citiesFromDictionary:response]];
        }
        
    }];
}

- (void)loadSavedCities {
    SavedCitiesDataManager *dataManager = [[SavedCitiesDataManager alloc] init];
    NSArray *savedCities = [dataManager loadStoredCities];
    if (savedCities) {
        [self.delegate searchCitiesInteractor:self didFetchCities:savedCities];
    } else {
        [self.delegate searchCitiesInteractor:self didFailFetchingCitiesWithError:[self noCitiesError]];
    }
}

- (NSError *)noCitiesError {
    NSString *message = NSLocalizedString(@"NO_CITIES_MESSAGE", nil);
    return [[NSError alloc] initWithDomain:@"com.interactor" code:0 userInfo:@{NSLocalizedDescriptionKey: message}];
}

#pragma mark - Private

- (NSArray <City *> * _Nonnull)citiesFromDictionary:(NSDictionary * _Nonnull)dictionary {
    
    NSArray <NSDictionary *> * rawCities = dictionary[@"result"];
    
    NSMutableArray *cities = [[NSMutableArray alloc] initWithCapacity:rawCities.count];
    
    for (NSDictionary *rawCity in rawCities) {
        [cities addObject:[[City alloc] initWithDictionary:rawCity]];
    }
    
    return [NSArray arrayWithArray:cities];
}


@end
