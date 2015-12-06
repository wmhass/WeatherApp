//
//  SearchCitiesPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchCitiesInteractor.h"

@class SearchCitiesViewController, SearchCitiesViewWireframe, CityDisplayData, SearchCitiesPresenter;

@protocol SearchCitiesPresenterDelegate <NSObject>

- (void)searchCitiesPresenter:(SearchCitiesPresenter * )presenter didSelectCityDisplayData:(CityDisplayData * )cityDisplayData;

@end

@interface SearchCitiesPresenter : NSObject <SearchCitiesInteractorDelegate>

@property (weak, nonatomic) id<SearchCitiesPresenterDelegate>  delegate;

@property (assign, nonatomic) SearchCitiesViewController *  searchCitiesView;
@property (strong, nonatomic) SearchCitiesInteractor *  searchCitiesInteractor;
@property (strong, nonatomic) SearchCitiesViewWireframe *  searchCitiesWireframe;

#pragma mark - Presenter actions

- (void)fetchCitiesWithSearchString:(NSString * )searchString;
- (void)didSelectCityDisplayData:(CityDisplayData * )cityDisplayData;

@end
