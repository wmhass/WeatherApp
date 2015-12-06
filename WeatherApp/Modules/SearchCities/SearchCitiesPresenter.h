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

- (void)searchCitiesPresenter:(SearchCitiesPresenter * _Nonnull)presenter didSelectCityDisplayData:(CityDisplayData * _Nonnull)cityDisplayData;

@end

@interface SearchCitiesPresenter : NSObject <SearchCitiesInteractorDelegate>

@property (weak, nonatomic) id<SearchCitiesPresenterDelegate> _Nullable delegate;

@property (assign, nonatomic) SearchCitiesViewController * _Nullable searchCitiesView;
@property (strong, nonatomic) SearchCitiesInteractor * _Nullable searchCitiesInteractor;
@property (strong, nonatomic) SearchCitiesViewWireframe * _Nullable searchCitiesWireframe;

#pragma mark - Presenter actions

- (void)fetchCitiesWithSearchString:(NSString * _Nullable)searchString;
- (void)didSelectCityDisplayData:(CityDisplayData * _Nonnull)cityDisplayData;

@end
