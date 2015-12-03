//
//  ForecastDataManager.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDataManager.h"
#import <AFNetworking/AFNetworking.h>

NSString * const APIKey = @"e09a42c0b1e877e6738cf26aa20ca";
NSString * const APIURI = @"http://api.worldweatheronline.com/free";
NSString * const APIVersion = @"v2";
NSString * const APIEndPoint = @"weather.ashx";

@implementation ForecastDataManager

#pragma mark - Public

- (void)fetchForecastRemoteInformationForCity:(NSString *)cityName withCompletion:(ForecastDataManagerCompletionBlock)completionBlock {
    
    //http://api.worldweatheronline.com/free/v2/weather.ashx?q=Dublin&format=json&num_of_days=5&key=4cc86076775e39d5d4f399e70293f
    
}


@end
