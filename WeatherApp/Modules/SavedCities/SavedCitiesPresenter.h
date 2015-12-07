//
//  SavedCitiesPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SavedCitiesViewController, SavedCitiesInteractor, CityDisplayData, SavedCitiesWireframe, SavedCitiesPresenter;

@protocol SavedCitiesPresenterDelegate <NSObject>

- (void)savedCitiesPresenter:(SavedCitiesPresenter * )presenter didSelectCityDisplay:(CityDisplayData * )cityDisplayData;

@end

@interface SavedCitiesPresenter : NSObject

@property (weak, nonatomic) id<SavedCitiesPresenterDelegate>  delegate;

@property (weak, nonatomic) SavedCitiesViewController *savedCitiesView;
@property (strong, nonatomic) SavedCitiesInteractor *savedCitiesInteractor;
@property (strong, nonatomic) SavedCitiesWireframe *savedCitiesWireframe;

- (void)viewWillAppear;
- (void)didSelectCityDisplay:(CityDisplayData * )cityDisplayData;
- (void)didTapCloseButton;

@end
