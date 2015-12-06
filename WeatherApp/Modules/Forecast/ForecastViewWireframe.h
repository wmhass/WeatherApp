//
//  ForecastViewWireframe.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SavedCitiesViewController, SavedCitiesWireframe;

@interface ForecastViewWireframe : NSObject

@property (strong, nonatomic) SavedCitiesWireframe * _Nonnull savedCitiesWireframe;

- (void)launchViewInWindow:(UIWindow * _Nonnull)window;
- (void)willPresentSavedCitiesView:(SavedCitiesViewController * _Nonnull)savedCitiesView;

@end
