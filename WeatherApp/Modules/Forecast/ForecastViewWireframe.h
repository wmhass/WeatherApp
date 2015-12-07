//
//  ForecastViewWireframe.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SavedCitiesWireframe, SearchCitiesViewWireframe;

@interface ForecastViewWireframe : NSObject

@property (strong, nonatomic) SavedCitiesWireframe *savedCitiesWireframe;
@property (strong, nonatomic) SearchCitiesViewWireframe *searchCitiesWireframe;

- (void)launchViewInWindow:(UIWindow * )window;
- (void)presentSavedCitiesViewWithDelegate:(id)delegate;
- (void)presentSearchViewInView:(UIView *)view;

@end
