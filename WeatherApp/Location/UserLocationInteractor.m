//
//  UserLocationInteractor.m
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "UserLocationInteractor.h"
#import "CustomLocationManager.h"
#import "UserLocation.h"

@interface UserLocationInteractor() <CustomLocationManagerDelegate>

@property (strong, nonatomic) CustomLocationManager *locationManager;

@end

@implementation UserLocationInteractor

#pragma mark - Initializers

- (id)init {
    self = [super init];
    if (self) {
        _locationManager = [[CustomLocationManager alloc] init];
        _locationManager.customManagerDelegate = self;
    }
    return self;
}


#pragma mark - Public

- (void)fetchUserLocation {
    [self.locationManager getLocation];
}


#pragma mark - CustomLocationManager

- (void)locationManager:(CustomLocationManager *)locationManager didGetLocationWithLatitude:(double)latitude andLongigtude:(double)longitude {
    
    [self.delegate userLocationInteractor:self didFetchUserLocation:[[UserLocation alloc] initWithLatitude:latitude longitude:longitude]];
    
}

@end
