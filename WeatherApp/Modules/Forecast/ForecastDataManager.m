//
//  ForecastDataManager.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastDataManager.h"
#import <AFNetworking/AFNetworking.h>

NSString * const APIKey = @"9968f117acac39952af7a517732e8";
NSString * const APIURI = @"http://api.worldweatheronline.com/free";
NSString * const APIVersion = @"v2";
NSString * const APIWeatherEndPoint = @"weather.ashx";
NSString * const APICitySearchEndPoint = @"search.ashx";
NSString * const APIResponsePrefferedFormat = @"json";

@implementation ForecastDataManager

#pragma mark - Private

- (NSString * )URLForEndPoint:(NSString * )endpoint {
    return [@[APIURI, APIVersion, endpoint] componentsJoinedByString:@"/"];
}

- (NSDictionary * )parametersWithParameterObject:(ForecastDataManagerParameters * )parameters {
    NSMutableDictionary *returnParameters = [@{@"format": APIResponsePrefferedFormat, @"key": APIKey} mutableCopy];

    if (parameters.cityName) {
        [returnParameters setObject:parameters.cityName forKey:@"q"];
    } else if (parameters.latitude.length > 0 && parameters.longitude > 0) {
        NSString *locationQuery = [NSString stringWithFormat:@"%@,%@",parameters.latitude, parameters.longitude];
        [returnParameters setObject:locationQuery forKey:@"q"];
    }
    
    if (parameters.numberOfDays) {
        [returnParameters setObject:parameters.numberOfDays forKey:@"num_of_days"];
    }
    
    return returnParameters;
}

- (NSString * )errorMessageForResponse:(NSDictionary * )responseObject {
    if (!responseObject) {
        return NSLocalizedString(@"REQUEST_ERROR_MESSAGE", @"No data recevied from the server");
    }
    return responseObject[@"data"][@"error"][0][@"mesg"];
}


- (NSError * )datamanagerErrorWithMessage:(NSString * )message {
    NSError *error = [[NSError alloc] initWithDomain:@"com.datamanager" code:0 userInfo:@{NSLocalizedDescriptionKey: message}];
    return error;
}

#pragma mark - Public

- (void)fetchForecastRemoteInformationWithParameters:(ForecastDataManagerParameters * )parameters withCompletion:(ForecastDataManagerCompletionBlock )completionBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    [manager GET:[self URLForEndPoint:APIWeatherEndPoint]
      parameters:[self parametersWithParameterObject:parameters]
         success:^(AFHTTPRequestOperation *  operation, id   responseObject) {
             
             NSString *  errorMessage = [self errorMessageForResponse:responseObject];
             
             if (errorMessage && completionBlock) {
                 completionBlock(nil, [self datamanagerErrorWithMessage:errorMessage]);
             } else  if(completionBlock) {
                 completionBlock([responseObject objectForKey:@"data"], nil);
             }
             
         }
         failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
             if (completionBlock) {
                 completionBlock(nil, [self datamanagerErrorWithMessage:error.localizedDescription]);
             }
         }];
}


- (void)fetchCitiesWithSearch:(NSString *)cityName withCompletion:(ForecastDataManagerCompletionBlock)completionBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    ForecastDataManagerParameters *parameters = [[ForecastDataManagerParameters alloc] init];
    parameters.cityName = cityName;
    
    __weak ForecastDataManager *weakSelf = self;
    [manager GET:[self URLForEndPoint:APICitySearchEndPoint]
      parameters:[self parametersWithParameterObject:parameters]
         success:^(AFHTTPRequestOperation *  operation, id   responseObject) {
             
             NSString *  errorMessage = [weakSelf errorMessageForResponse:responseObject];
             
             if (errorMessage && completionBlock) {
                 completionBlock(nil, [weakSelf datamanagerErrorWithMessage:errorMessage]);
             } else  if(completionBlock) {
                 completionBlock(responseObject[@"search_api"], nil);
             }
             
         }
         failure:^(AFHTTPRequestOperation *  operation, NSError *  error) {
             if (completionBlock) {
                 completionBlock(nil, [weakSelf datamanagerErrorWithMessage:error.localizedDescription]);
             }
         }];
}

@end
