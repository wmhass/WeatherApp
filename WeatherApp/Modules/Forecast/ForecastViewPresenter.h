//
//  ForecastViewPresenter.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForecastViewController, ForecastViewWireframe,UIStoryboardSegue;
@interface ForecastViewPresenter : NSObject

@property (weak, nonatomic) ForecastViewController * forecastView;
@property (strong, nonatomic) ForecastViewWireframe *  _Nonnull forecastWireframe;

#pragma mark - Presenter Actions

- (void)doInitialLoad;

@end
