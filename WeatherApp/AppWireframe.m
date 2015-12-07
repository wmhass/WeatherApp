//
//  AppWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "AppWireframe.h"
#import "ForecastViewWireframe.h"
#import "SavedCitiesWireframe.h"

@interface AppWireframe()

@property (strong, nonatomic) ForecastViewWireframe *rootWireframe;

@end

@implementation AppWireframe

- (void)installRootViewInWindow:(UIWindow *)window {

    self.rootWireframe = [[ForecastViewWireframe alloc] init];
    self.rootWireframe.savedCitiesWireframe = [[SavedCitiesWireframe alloc] init];
    [self.rootWireframe launchViewInWindow:window];
    
    [window makeKeyAndVisible];
}

@end
