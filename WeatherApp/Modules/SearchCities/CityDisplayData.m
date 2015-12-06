//
//  CityDisplayData.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "CityDisplayData.h"

@implementation CityDisplayData


#pragma mark - Public (Rewrtitten)

- (NSString * _Nonnull)description {
    
    NSMutableArray *descriptionComponents = [[NSMutableArray alloc] initWithCapacity:3];
    
    if (self.city) {
        [descriptionComponents addObject:self.city];
    }
    
    if (self.region) {
        [descriptionComponents addObject:self.region];
    }
    
    if (self.country) {
        [descriptionComponents addObject:self.country];
    }
    
    return [descriptionComponents componentsJoinedByString:@", "];
}


@end