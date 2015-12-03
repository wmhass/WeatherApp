//
//  InitialDrawerSegues.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "InitialDrawerSegues.h"
#import <MMDrawerController/MMDrawerController.h>

NSString * const InitialDrawerLeftViewSegueIdentifier = @"left_drawer_segue";
NSString * const InitialDrawerCenterViewSegueIdentifier = @"center_drawer_segue";

@implementation InitialDrawerSegues

- (void)perform {
    if ([self.identifier isEqualToString:InitialDrawerLeftViewSegueIdentifier]) {
        [self performLeftDrawerSegue];
    } else if ([self.identifier isEqualToString:InitialDrawerCenterViewSegueIdentifier]) {
        [self performCenterDrawerSegue];
    }
}

- (void)performLeftDrawerSegue {
    MMDrawerController *drawerController = (MMDrawerController *)self.sourceViewController;
    [drawerController setLeftDrawerViewController:self.destinationViewController];
}

- (void)performCenterDrawerSegue {
    MMDrawerController *drawerController = (MMDrawerController *)self.sourceViewController;
    [drawerController setCenterViewController:self.destinationViewController];
}

@end
