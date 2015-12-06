//
//  SavedCitiesWireframe.h
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SavedCitiesPresenter.h"

@interface SavedCitiesWireframe : NSObject

- (void)presentInViewControllerContext:(UIViewController *)context delegate:(id<SavedCitiesPresenterDelegate>)delegate;
- (void)closeView;

@end
