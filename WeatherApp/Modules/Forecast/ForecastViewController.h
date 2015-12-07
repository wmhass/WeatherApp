//
//  ForecastViewController.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForecastViewPresenter, SearchCitiesViewController, ForecastDisplayData, CityDisplayData;

@interface ForecastViewController : UIViewController

@property (strong, nonatomic) ForecastViewPresenter *presenter;

- (void)reloadAllData;

- (void)presentErrorMessage:(NSString * )message;
- (void)presentEmptySavedCities;

- (void)dismissSearchCitiesView;
- (void)presentSearchCitiesView;

- (void)displayForecast:(ForecastDisplayData * )displayData;
- (void)displayCity:(CityDisplayData * )cityDisplay;

- (void)showLoadingView;
- (void)hideLoadingView;

// Datasource methods
- (NSInteger)selectedMetric;
- (NSString * )searchingCityString;
- (CityDisplayData * )presentingCity;
- (UIView *)viewForPresentingSearchController;

@end
