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

@property (strong, nonatomic) ForecastViewPresenter * _Nullable presenter;

- (void)presentErrorMessage:(NSString * _Nonnull)message;
- (void)displayForecastData:(ForecastDisplayData * _Nullable)displayData;
- (void)displayCity:(CityDisplayData * _Nonnull)cityDisplay;
- (void)presentNoCitiesFoundMessage:(NSString * _Nonnull)message;
- (void)reloadAllData;
- (void)presentSearchCitiesView:(SearchCitiesViewController * _Nonnull)viewController;
- (void)dismissSearchCitiesView;

- (NSInteger)selectedMetric;
- (NSString * _Nullable)searchingCityString;
- (CityDisplayData * _Nullable)presentingCity;

@end
