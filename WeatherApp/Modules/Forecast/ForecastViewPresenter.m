//
//  ForecastViewPresenter.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewPresenter.h"
#import "ForecastViewController.h"
#import "ForecastViewWireframe.h"

@interface ForecastViewPresenter()

@end

@implementation ForecastViewPresenter

#pragma mark - Presenter Actions

- (void)doInitialLoad {
    [self.forecastWireframe didPresentSearchView:self.forecastView.searchCitiesController];
}

@end
