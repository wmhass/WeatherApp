//
//  SavedCitiesViewController.h
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SavedCitiesPresenter, CitiesListDisplayData;
@interface SavedCitiesViewController : UIViewController

@property (strong, nonatomic) SavedCitiesPresenter * _Nonnull presenter;

- (void)displayData:(CitiesListDisplayData * _Nonnull)listDisplayData;
- (void)reloadAllData;
- (void)presentEmptyContent;

@end