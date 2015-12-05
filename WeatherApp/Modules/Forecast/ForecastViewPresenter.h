//
//  ForecastViewPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastViewInteractor.h"

@class ForecastViewController, ForecastViewWireframe, ForecastViewInteractor, UIStoryboardSegue;

@interface ForecastViewPresenter : NSObject <ForecastViewInteractorDelegate>

@property (weak, nonatomic) ForecastViewController * _Nullable forecastView;
@property (strong, nonatomic) ForecastViewWireframe *  _Nullable forecastWireframe;
@property (strong, nonatomic) ForecastViewInteractor * _Nullable forecastInteractor;

#pragma mark - Presenter Actions

- (void)doInitialLoad;
- (void)reloadViewData;

@end
