//
//  SavedCitiesWireframe.h
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SavedCitiesViewController;
@interface SavedCitiesWireframe : NSObject

- (void)setupSavedCitiesView:(SavedCitiesViewController * )savedCitiesView;
- (void)closeView;

@end
