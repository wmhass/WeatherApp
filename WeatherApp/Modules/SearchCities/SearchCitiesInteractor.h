//
//  SearchCitiesInteractor.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SearchCitiesInteractor, City;
@protocol SearchCitiesInteractorDelegate

- (void)searchCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFetchCities:(NSArray <City *> * _Nonnull)cities;
- (void)searchCitiesInteractor:(SearchCitiesInteractor * _Nonnull)interactor didFailFetchingCitiesWithError:(NSError * _Nonnull)error;

@end

@interface SearchCitiesInteractor : NSObject

@property (weak, nonatomic) id<SearchCitiesInteractorDelegate> _Nullable delegate;

- (void)searchCitiesWithSearchString:(NSString * _Nonnull)searchString;
- (void)loadSavedCities;

@end
