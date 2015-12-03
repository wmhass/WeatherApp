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
NSString * const APIWeatherEndPoint = @"weather.ashx";
NSString * const APIResponsePrefferedFormat = @"json";

@implementation ForecastDataManager

#pragma mark - Private

+ (NSString * _Nonnull)URLForEndPoint:(NSString * _Nonnull)endpoint {
    return [@[APIURI, APIVersion, endpoint] componentsJoinedByString:@"/"];
}

+ (NSDictionary * _Nonnull)parametersWithParameterObject:(ForecastDataManagerParameters * _Nonnull)parameters {
    NSMutableDictionary *returnParameters = [@{
                                               @"format": APIResponsePrefferedFormat,
                                               @"key": APIKey
                                               } mutableCopy];
    
    if (parameters.cityName) {
        [returnParameters setObject:parameters.cityName forKey:@"q"];
    }
    if (parameters.numberOfDays) {
        [returnParameters setObject:parameters.numberOfDays forKey:@"number_of_days"];
    }
    
    return returnParameters;
}

+ (NSString * __nullable)errorMessageForResponse:(NSDictionary * __nullable)responseObject {
    return [[[[responseObject objectForKey:@"data"] objectForKey:@"error"] lastObject] objectForKey:@"msg"];
}

#pragma mark - Public

- (void)fetchForecastRemoteInformationWithParameters:(ForecastDataManagerParameters * _Nonnull)parameters withCompletion:(ForecastDataManagerCompletionBlock _Nullable)completionBlock {
    
    //http://api.worldweatheronline.com/free/v2/weather.ashx?q=Dublin&format=json&num_of_days=5&key=4cc86076775e39d5d4f399e70293f
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager GET:[ForecastDataManager URLForEndPoint:APIWeatherEndPoint]
      parameters:[ForecastDataManager parametersWithParameterObject:parameters]
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             NSString *errorMessage = [ForecastDataManager errorMessageForResponse:responseObject];
             
             if (errorMessage) {
                 NSLog(@"Error: %@", errorMessage);
                 
             } else {
                 //TODO: Parse response
                 NSLog(@"Response object: %@",responseObject);
             }
             
         }
         failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
             NSLog(@"Error!: %@", error.localizedDescription);
         }];
}


@end
