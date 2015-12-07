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

@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *region;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) City *referencedModel;
@property (nonatomic, readonly) BOOL saved;

// Explicitng we are rewriting this method
- (NSString * )description;
- (id)initWithCity:(City *)city;

@end
