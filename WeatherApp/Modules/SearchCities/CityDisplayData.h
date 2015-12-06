//
//  CityDisplayData.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;
@interface CityDisplayData : NSObject

@property (strong, nonatomic) NSString * _Nullable country;
@property (strong, nonatomic) NSString * _Nullable city;
@property (strong, nonatomic) NSString * _Nullable region;
@property (strong, nonatomic) NSString * _Nullable latitude;
@property (strong, nonatomic) NSString * _Nullable longitude;
@property (strong, nonatomic) City * _Nullable referencedModel;
@property (nonatomic) BOOL stored;

// Explicitng we are rewriting this method
- (NSString * _Nonnull)description;

@end