//
//  ForecastViewWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewWireframe.h"
#import "SearchCitiesViewController.h"

@interface ForecastViewWireframe()

@property (weak, nonatomic) SearchCitiesViewController *presentedSearchView;

@end

@implementation ForecastViewWireframe

- (void)didPresentSearchView:(SearchCitiesViewController *)searchView {
    self.presentedSearchView = searchView;
    // TODO: Set presenter, wireframe....
}

@end
