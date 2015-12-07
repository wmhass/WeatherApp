//
//  SearchCitiesViewWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SearchCitiesViewWireframe.h"
#import "AppStoryboard.h"
#import "SearchCitiesViewController.h"
#import "SearchCitiesPresenter.h"
#import "WorldWeatherDataManager.h"

@implementation SearchCitiesViewWireframe

#pragma mark - Public

- (SearchCitiesViewController *)searchCitiesViewController {

    SearchCitiesViewController *controller = (SearchCitiesViewController *)[[AppStoryboard sharedInstance] viewControllerWithIdentifier:SearchCitiesViewControllerIdentifier];
    
    controller.presenter = [[SearchCitiesPresenter alloc] init];
    controller.presenter.searchCitiesWireframe = self;
    controller.presenter.searchCitiesView = controller;
    controller.presenter.searchCitiesInteractor = [[SearchCitiesInteractor alloc] init];
    controller.presenter.searchCitiesInteractor.delegate = controller.presenter;
    controller.presenter.searchCitiesInteractor.dataManager = [[WorldWeatherDataManager alloc] init];
    return controller;
}


@end
