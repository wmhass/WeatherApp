//
//  UserLocation.h
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLocation : NSObject

@property (strong, nonatomic, readonly) NSString *latitude;
@property (strong, nonatomic, readonly) NSString *longitude;

- (id)initWithLatitude:(double)latitude longitude:(double)longitude;

@end
