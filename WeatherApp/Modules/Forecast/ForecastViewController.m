//
//  ForecastViewController.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewController.h"
#import "ForecastViewPresenter.h"

@interface ForecastViewController ()

@end

@implementation ForecastViewController

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
    [self.presenter doInitialLoad];
}

@end
