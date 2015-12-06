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

@property (strong, nonatomic) ForecastViewPresenter *  presenter;

- (void)presentErrorMessage:(NSString * )message;
- (void)displayForecastData:(ForecastDisplayData * )displayData;
- (void)displayCity:(CityDisplayData * )cityDisplay;
- (void)presentNoCitiesFoundMessage:(NSString * )message;
- (void)reloadAllData;
- (void)presentSearchCitiesView:(SearchCitiesViewController * )viewController;
- (void)dismissSearchCitiesView;

- (NSInteger)selectedMetric;
- (NSString * )searchingCityString;
- (CityDisplayData * )presentingCity;

@end
