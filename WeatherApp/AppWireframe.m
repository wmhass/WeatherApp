//
//  AppWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "AppWireframe.h"
#import "InitialDrawerViewWireframe.h"

@implementation AppWireframe

- (void)installRootViewInWindow:(UIWindow *)window {
    [window makeKeyAndVisible];

    InitialDrawerViewWireframe *wireframe = [[InitialDrawerViewWireframe alloc] init];
    [wireframe launchInitialViewInWindow:window];
}

@end
