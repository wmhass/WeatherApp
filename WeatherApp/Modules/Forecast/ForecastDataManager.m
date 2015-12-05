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
    NSMutableDictionary *returnParameters = [@{@"format": APIResponsePrefferedFormat, @"key": APIKey} mutableCopy];

    if (parameters.cityName) {
        [returnParameters setObject:parameters.cityName forKey:@"q"];
    }
    if (parameters.numberOfDays) {
        [returnParameters setObject:parameters.numberOfDays forKey:@"num_of_days"];
    }
    
    return returnParameters;
}

+ (NSString * _Nullable)errorMessageForResponse:(NSDictionary * _Nullable)responseObject {
    NSDictionary *data = [responseObject objectForKey:@"data"];
    if (!data) {
        return NSLocalizedString(@"REQUEST_ERROR_MESSAGE", @"No data recevied from the server");
    }
    return [[[data objectForKey:@"error"] lastObject] objectForKey:@"msg"];
}


+ (NSError * _Nonnull)datamanagerErrorWithMessage:(NSString * _Nonnull)message {
    NSError *error = [[NSError alloc] initWithDomain:@"com.datamanager" code:0 userInfo:@{NSLocalizedDescriptionKey: message}];
    return error;
}

#pragma mark - Public

- (void)fetchForecastRemoteInformationWithParameters:(ForecastDataManagerParameters * _Nonnull)parameters withCompletion:(ForecastDataManagerCompletionBlock _Nullable)completionBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager GET:[ForecastDataManager URLForEndPoint:APIWeatherEndPoint]
      parameters:[ForecastDataManager parametersWithParameterObject:parameters]
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             NSString * _Nonnull errorMessage = [ForecastDataManager errorMessageForResponse:responseObject];
             
             if (errorMessage && completionBlock) {
                 completionBlock(nil, [ForecastDataManager datamanagerErrorWithMessage:errorMessage]);
             } else  if(completionBlock) {
                 completionBlock([responseObject objectForKey:@"data"], nil);
             }
             
         }
         failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
             if (completionBlock) {
                 completionBlock(nil, [ForecastDataManager datamanagerErrorWithMessage:error.localizedDescription]);
             }
         }];
}


@end
