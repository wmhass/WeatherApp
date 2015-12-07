//
//  ForecastViewWireframe.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SavedCitiesWireframe;

@interface ForecastViewWireframe : NSObject

@property (strong, nonatomic) SavedCitiesWireframe *savedCitiesWireframe;

- (void)launchViewInWindow:(UIWindow * )window;
- (void)presentSavedCitiesViewWithDelegate:(id)delegate;

@end
