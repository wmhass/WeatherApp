//
//  ForecastViewController.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForecastViewPresenter, SearchCitiesViewController, ForecastDisplayData, CityDisplayData, CitiesListDisplayData;

@interface ForecastViewController : UIViewController

@property (strong, nonatomic) ForecastViewPresenter * _Nullable presenter;

- (CityDisplayData * _Nullable)selectedCity;
- (NSInteger)selectedMetric;
- (void)presentErrorMessage:(NSString * _Nonnull)message;
- (void)displayForecastData:(ForecastDisplayData * _Nullable)displayData;
- (void)displayCities:(CitiesListDisplayData * _Nonnull)citiesList;
- (void)displayCity:(CityDisplayData * _Nonnull)cityDisplay;
- (void)presentNoCitiesFoundMessage:(NSString * _Nonnull)message;
- (void)reloadAllData;
- (void)presentSearchCitiesView:(SearchCitiesViewController * _Nonnull)viewController;
- (void)dismissSearchCitiesView;
- (NSString * _Nullable)searchingCityString;

@end
