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
#import "SavedCitiesViewController.h"

#import <UIKit/UIKit.h>
#import <MMDrawerController/MMDrawerController.h>

@implementation InitialDrawerViewWireframe

- (void)launchInitialViewInWindow:(UIWindow *)window {
    
    MMDrawerController *drawer = [[AppStoryboard sharedInstance] initialViewController];
    [drawer performSegueWithIdentifier:InitialDrawerCenterViewSegueIdentifier sender:self];
    [drawer performSegueWithIdentifier:InitialDrawerLeftViewSegueIdentifier sender:self];
    
    ForecastViewController *forecastView = (ForecastViewController *)drawer.centerViewController;
    // TODO: Setup forecastview
    
    SavedCitiesViewController *savedCitiesView = (SavedCitiesViewController *)drawer.leftDrawerViewController;
    // TODO: Setup savedcitiesview
    
    window.rootViewController = drawer;
}

@end
