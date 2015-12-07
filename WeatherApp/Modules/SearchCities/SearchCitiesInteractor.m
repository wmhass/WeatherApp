//
//  SearchCitiesInteractor.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SearchCitiesInteractor.h"
#import "City.h"
#import "WorldWeatherDataManager.h"
#import "SavedCitiesDataManager.h"

@implementation SearchCitiesInteractor

#pragma mark - Public 

- (void)searchCitiesWithSearchString:(NSString * )searchString {
    
    __weak SearchCitiesInteractor *weakSelf = self;
    [self.dataManager fetchCitiesWithSearch:searchString withCompletion:^(NSArray <City *> * cities, NSError *error) {

        if (error) {
            [weakSelf.delegate searchCitiesInteractor:weakSelf didFailFetchingCitiesWithError:error];
        } else {
            [weakSelf.delegate searchCitiesInteractor:weakSelf didFetchCities:cities];
        }
        
    }];
}

@end
