//
//  ForecastViewPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastViewController;
@interface ForecastViewPresenter : NSObject

@property (weak, nonatomic) ForecastViewController *forecastView;

#pragma mark - Presenter Actions

- (void)doInitialLoad;

@end
