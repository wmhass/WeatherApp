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
#import "WorldWeatherDataManager.h"
#import "SavedCitiesWireframe.h"

#import "AppStoryboard.h"

@interface ForecastViewWireframe()

@property (weak, nonatomic) ForecastViewController *presentingView;

@end

@implementation ForecastViewWireframe

#pragma mark - Public

- (void)launchViewInWindow:(UIWindow *)window {
    
    ForecastViewController *forecastView = (ForecastViewController *)[[AppStoryboard sharedInstance] initialViewController];
    
    forecastView.presenter = [[ForecastViewPresenter alloc] init];
    
    forecastView.presenter.forecastWireframe = self;
    forecastView.presenter.forecastInteractor = [[ForecastViewInteractor alloc] init];
    
    forecastView.presenter.forecastView = forecastView;
    forecastView.presenter.forecastInteractor.delegate = forecastView.presenter;
    forecastView.presenter.forecastInteractor.dataManager = [[WorldWeatherDataManager alloc] init];
    
    window.rootViewController = forecastView;

    self.presentingView = forecastView;
}

- (void)presentSavedCitiesViewWithDelegate:(id)delegate {
    [self.savedCitiesWireframe presentInViewControllerContext:self.presentingView delegate:delegate];
}

@end
