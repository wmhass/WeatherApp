//
//  SearchCitiesViewWireframe.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SearchCitiesViewController, UIView, UIViewController;
@interface SearchCitiesViewWireframe : NSObject

@property (weak, nonatomic, readonly) SearchCitiesViewController *presentingView;

- (void)presentSearchCitiesInView:(UIView *)view viewControllerContext:(UIViewController *)context;


@end
