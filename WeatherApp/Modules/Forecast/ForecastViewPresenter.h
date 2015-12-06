//
//  ForecastViewPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastViewInteractor.h"

@class ForecastViewController, ForecastViewWireframe, ForecastViewInteractor, SavedCitiesWireframe;
@interface ForecastViewPresenter : NSObject <ForecastViewInteractorDelegate>

@property (weak, nonatomic) ForecastViewController *  forecastView;
@property (strong, nonatomic) ForecastViewWireframe *   forecastWireframe;
@property (strong, nonatomic) ForecastViewInteractor *  forecastInteractor;
@property (strong, nonatomic) SavedCitiesWireframe * savedCitiesWireframe;

#pragma mark - Presenter Actions

- (void)doInitialLoad;
- (void)reloadViewData;
- (BOOL)canStartSearchingCity;
- (void)cancelCitySearch;
- (void)citySearchTextChanged;
- (void)saveCity;
- (void)removeCity;
- (void)metricValueChanged;
- (void)presentMyCities;

@end
