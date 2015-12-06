//
//  City.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject <NSCoding>

@property (strong, nonatomic) NSString *  country;
@property (strong, nonatomic) NSString *  city;
@property (strong, nonatomic) NSString *  region;
@property (strong, nonatomic) NSString *  latitude;
@property (strong, nonatomic) NSString *  longitude;
@property (nonatomic) BOOL saved;

- (id )initWithDictionary:(NSDictionary * )dictionary;

@end
