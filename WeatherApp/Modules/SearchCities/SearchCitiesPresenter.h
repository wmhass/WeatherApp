//
//  SearchCitiesPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchCitiesInteractor.h"

@class SearchCitiesViewController;
@interface SearchCitiesPresenter : NSObject <SearchCitiesInteractorDelegate>

@property (weak, nonatomic) SearchCitiesViewController * _Nullable searchCitiesView;
@property (strong, nonatomic) SearchCitiesInteractor * _Nullable searchCitiesInteractor;

#pragma mark - Presenter actions
- (void)fetchCities;

@end
