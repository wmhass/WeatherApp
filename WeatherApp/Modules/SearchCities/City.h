//
//  City.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject <NSCoding>

@property (strong, nonatomic) NSString * _Nonnull country;
@property (strong, nonatomic) NSString * _Nonnull city;
@property (strong, nonatomic) NSString * _Nonnull region;
@property (strong, nonatomic) NSString * _Nonnull latitude;
@property (strong, nonatomic) NSString * _Nonnull longitude;
@property (nonatomic) BOOL saved;

- (id _Nonnull)initWithDictionary:(NSDictionary * _Nonnull)dictionary;

@end
