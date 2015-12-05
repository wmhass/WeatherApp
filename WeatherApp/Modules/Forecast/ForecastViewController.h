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

- (CityDisplayData * _Nullable)selectedCity;
- (NSInteger)selectedMetric;
- (void)presentErrorMessage:(NSString * _Nonnull)message;
- (void)displayData:(ForecastDisplayData * _Nullable)displayData;
- (void)reloadAllData;


@end
