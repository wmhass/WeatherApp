//
//  ForecastWeatherDescription.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastWeatherDescription : NSObject

- (id )initWithValues:(NSArray<NSDictionary *> * )values;

// Explicitng we are rewriting this method
- (NSString * )description;

@end
