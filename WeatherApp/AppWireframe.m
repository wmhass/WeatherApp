//
//  AppWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "AppWireframe.h"
#import "AppStoryboard.h"

#import "ForecastViewController.h"

@implementation AppWireframe

- (void)installRootViewInWindow:(UIWindow *)window {
    [window makeKeyAndVisible];
    
    ForecastViewController *initialViewController = [[AppStoryboard sharedInstance] initialViewController];
    window.rootViewController = initialViewController;
    
}

@end
