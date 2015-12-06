//
//  City.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "City.h"

@implementation City


#pragma mark - Initializers

- (id _Nonnull)initWithDictionary:(NSDictionary * _Nonnull)dictionary {
    self = [super init];
    if(self) {
        
        _country = dictionary[@"country"][0][@"value"];
        _city = dictionary[@"areaName"][0][@"value"];
        _region = dictionary[@"region"][0][@"value"];
        _latitude = dictionary[@"latitude"];
        _longitude = dictionary[@"longitude"];
        
    }
    return self;
}


#pragma mark - Overriden

- (NSUInteger)hash {
    return [self.country hash] ^ [self.city hash] ^ [self.region hash] ^ [self.latitude hash] ^ [self.longitude hash];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.country forKey:@"country"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.region forKey:@"region"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _country = [aDecoder decodeObjectForKey:@"country"];
        _city = [aDecoder decodeObjectForKey:@"city"];
        _region = [aDecoder decodeObjectForKey:@"region"];
        _latitude = [aDecoder decodeObjectForKey:@"latitude"];
        _longitude = [aDecoder decodeObjectForKey:@"longitude"];
    }
    return self;
}


@end
