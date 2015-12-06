//
//  SavedCitiesViewController.h
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const SavedCitiesViewControllerIdentifier;

@class SavedCitiesPresenter, CitiesListDisplayData;
@interface SavedCitiesViewController : UIViewController

@property (strong, nonatomic) SavedCitiesPresenter *presenter;

- (void)reloadAllData;
- (void)displayCitiesList:(CitiesListDisplayData * )listDisplayData;
- (void)presentEmptySavedCities;

@end
