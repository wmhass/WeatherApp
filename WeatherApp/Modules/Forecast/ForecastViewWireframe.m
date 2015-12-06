//
//  ForecastViewWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewWireframe.h"
#import "ForecastViewController.h"
#import "ForecastViewInteractor.h"
#import "ForecastViewPresenter.h"

#import "SavedCitiesWireframe.h"

#import "AppStoryboard.h"

@interface ForecastViewWireframe()

@property (weak, nonatomic) ForecastViewController * _Nullable presentingView;

@end

@implementation ForecastViewWireframe

#pragma mark - Public

- (void)launchViewInWindow:(UIWindow *_Nonnull)window {
    
    ForecastViewController *forecastView = (ForecastViewController *)[[AppStoryboard sharedInstance] initialViewController];
    forecastView.presenter = [[ForecastViewPresenter alloc] init];
    forecastView.presenter.forecastView = forecastView;
    forecastView.presenter.forecastWireframe = [[ForecastViewWireframe alloc] init];
    forecastView.presenter.forecastInteractor = [[ForecastViewInteractor alloc] init];
    forecastView.presenter.forecastInteractor.delegate = forecastView.presenter;
    
    self.presentingView = forecastView;
    
    window.rootViewController = forecastView;
}

- (void)willPresentSavedCitiesView:(SavedCitiesViewController *_Nonnull)savedCitiesView {
    [self.savedCitiesWireframe setupSavedCitiesView:savedCitiesView];
}

@end
