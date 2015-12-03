//
//  InitialDrawerViewWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "InitialDrawerViewWireframe.h"
#import "AppStoryboard.h"
#import "InitialDrawerSegues.h"

#import "ForecastViewController.h"
#import "ForecastViewPresenter.h"
#import "ForecastViewWireframe.h"

#import "SavedCitiesViewController.h"
#import <UIKit/UIKit.h>
#import <MMDrawerController/MMDrawerController.h>

@implementation InitialDrawerViewWireframe

- (void)launchInitialViewInWindow:(UIWindow *)window {
    
    MMDrawerController *drawer = [[AppStoryboard sharedInstance] initialViewController];
    [drawer performSegueWithIdentifier:InitialDrawerCenterViewSegueIdentifier sender:self];
    [drawer performSegueWithIdentifier:InitialDrawerLeftViewSegueIdentifier sender:self];
    
    ForecastViewController *forecastView = (ForecastViewController *)drawer.centerViewController;
    forecastView.presenter = [[ForecastViewPresenter alloc] init];
    forecastView.presenter.forecastView = forecastView;
    forecastView.presenter.forecastWireframe = [[ForecastViewWireframe alloc] init];
    
    // TODO: Setup savedcitiesview
    //SavedCitiesViewController *savedCitiesView = (SavedCitiesViewController *)drawer.leftDrawerViewController;
    
    window.rootViewController = drawer;
}

@end
