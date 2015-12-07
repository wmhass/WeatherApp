//
//  ForecastViewPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastViewInteractor.h"

@class ForecastViewController, ForecastViewWireframe, SavedCitiesInteractor;
@interface ForecastViewPresenter : NSObject <ForecastViewInteractorDelegate>

@property (strong, nonatomic) ForecastViewWireframe * forecastWireframe;
@property (weak, nonatomic) ForecastViewController *forecastView;
@property (strong, nonatomic) ForecastViewInteractor *forecastInteractor;

@property (strong, nonatomic) SavedCitiesInteractor *savedCitiesInteractor;

#pragma mark - Presenter Actions

- (void)viewWillAppear;
- (void)citySearchTextChanged;
- (void)metricValueChanged;
- (void)didTapCancelSearchButton;
- (void)didTapSaveCityButton;
- (void)didTapRemoveCityButton;
- (void)didStartTypingCitySearch;
- (void)didTapMyCitiesButton;

@end
