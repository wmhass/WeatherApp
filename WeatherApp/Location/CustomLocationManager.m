//
//  CustomLocationManager.m
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "CustomLocationManager.h"
#import <UIKit/UIKit.h>

@interface CustomLocationManager() <CLLocationManagerDelegate>

@end

@implementation CustomLocationManager

#pragma mark - Initializers

- (id)init {
    self = [super init];
    if(self) {
        self.desiredAccuracy = kCLLocationAccuracyBest;
        self.delegate = self;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
            self.allowsBackgroundLocationUpdates = YES;
        }
    }
    return self;
}

#pragma mark - Public

- (void)startTracking {
    [self requestWhenInUseAuthorization];
    [self startUpdatingLocation];
}

- (void)stopTracking {
    [self stopUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];
    [self.customManagerDelegate locationManager:self didGetLocationWithLatitude:location.coordinate.latitude andLongigtude:location.coordinate.longitude];
}

@end
