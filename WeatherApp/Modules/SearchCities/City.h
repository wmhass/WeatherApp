//
//  City.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

// TODO: Clean comments
@property (strong, nonatomic) NSString * _Nonnull country;
@property (strong, nonatomic) NSString * _Nonnull city;
@property (strong, nonatomic) NSString * _Nonnull region; // State
@property (strong, nonatomic) NSString * _Nonnull latitude;
@property (strong, nonatomic) NSString * _Nonnull longitude;

- (id)initWithDictionary:(NSDictionary * _Nonnull)dictionary;

@end
