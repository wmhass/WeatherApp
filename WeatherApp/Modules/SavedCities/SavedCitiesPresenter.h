//
//  SavedCitiesPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SavedCitiesViewController, SavedCitiesInteractor, CityDisplayData, SavedCitiesWireframe;
@interface SavedCitiesPresenter : NSObject

@property (weak, nonatomic) SavedCitiesViewController * _Nullable savedCitiesView;
@property (strong, nonatomic) SavedCitiesInteractor * _Nullable savedCitiesInteractor;
@property (strong, nonatomic) SavedCitiesWireframe * _Nullable savedCitiesWireframe;

- (void)loadData;
- (void)didSelectCityDisplay:(CityDisplayData * _Nonnull)cityDisplayData;
- (void)didTapCloseButton;

@end
