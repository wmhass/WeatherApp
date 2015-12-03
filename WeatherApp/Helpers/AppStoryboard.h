//
//  AppStoryboard.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMDrawerController;
@interface AppStoryboard : NSObject

+ (instancetype)sharedInstance;
- (MMDrawerController *)initialViewController;

@end
