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

NSString * const ForecastViewSearchSegueIdentifier = @"search_segue";

@interface ForecastViewPresenter()

@end

@implementation ForecastViewPresenter

#pragma mark - Presenter Actions

- (void)doInitialLoad {
    
}

- (void)prepareForSegue:(nonnull UIStoryboardSegue *)segue {
    if ([segue.identifier isEqualToString:ForecastViewSearchSegueIdentifier]) {
        [self.forecastWireframe willPresentSearchView:(SearchCitiesViewController *)segue.destinationViewController];
    }
}

@end
