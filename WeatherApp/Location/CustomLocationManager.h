//
//  CustomLocationManager.h
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@class CustomLocationManager;
@protocol CustomLocationManagerDelegate

- (void)locationManager:(CustomLocationManager *)locationManager didGetLocationWithLatitude:(double)latitude andLongigtude:(double)longitude;

@end

@interface CustomLocationManager : CLLocationManager

@property (weak, nonatomic) id<CustomLocationManagerDelegate> customManagerDelegate;

- (void)startTracking;
- (void)stopTracking;

@end
