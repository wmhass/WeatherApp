//
//  SearchCitiesInteractor.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SearchCitiesInteractor, City;

@protocol SearchCitiesInteractorDelegate <NSObject>

- (void)searchCitiesInteractor:(SearchCitiesInteractor * )interactor didFetchCities:(NSArray <City *> * )cities;
- (void)searchCitiesInteractor:(SearchCitiesInteractor * )interactor didFailFetchingCitiesWithError:(NSError * )error;

@end

@interface SearchCitiesInteractor : NSObject

@property (weak, nonatomic) id<SearchCitiesInteractorDelegate>  delegate;

- (void)searchCitiesWithSearchString:(NSString * )searchString;

@end
