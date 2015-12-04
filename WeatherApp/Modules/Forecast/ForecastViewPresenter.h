//
//  ForecastViewPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastViewController, ForecastViewWireframe, ForecastViewInteractor, UIStoryboardSegue;
@protocol ForecastViewInteractorDelegate;

@interface ForecastViewPresenter : NSObject <ForecastViewInteractorDelegate>

@property (weak, nonatomic) ForecastViewController * forecastView;
@property (strong, nonatomic) ForecastViewWireframe *  _Nonnull forecastWireframe;
@property (strong, nonatomic) ForecastViewInteractor * _Nonnull forecastInteractor;

#pragma mark - Presenter Actions

- (void)doInitialLoad;
- (void)reloadViewData;

@end
