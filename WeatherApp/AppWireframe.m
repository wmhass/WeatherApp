//
//  AppWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "AppWireframe.h"
#import "ForecastViewWireframe.h"

@implementation AppWireframe

- (void)installRootViewInWindow:(UIWindow *)window {
    [window makeKeyAndVisible];

    ForecastViewWireframe *wireframe = [[ForecastViewWireframe alloc] init];
    [wireframe launchViewInWindow:window];
}

@end
