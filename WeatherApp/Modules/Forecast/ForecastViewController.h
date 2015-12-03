//
//  ForecastViewController.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ForecastViewPresenter, SearchCitiesViewController;
@interface ForecastViewController : UIViewController

@property (strong, nonatomic) ForecastViewPresenter *presenter;
@property (weak, nonatomic, readonly) SearchCitiesViewController *searchCitiesController;

@end
