//
//  ForecastViewInteractor.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewInteractor.h"
#import "ForecastDataManager.h"
#import "Forecast.h"

static NSInteger const ForecastViewInteractorNumberOfDays = 5;

@interface ForecastViewInteractor()

@property (strong, nonatomic) Forecast *cachedForecast;

@end

@implementation ForecastViewInteractor


#pragma mark - Public 

- (void)loadForecastForLatitude:(NSString *)latitude longitude:(NSString *)longitude {
    
    ForecastDataManager *manager = [[ForecastDataManager alloc] init];
    ForecastDataManagerParameters *parameters = [[ForecastDataManagerParameters alloc] init];
    parameters.numberOfDays = @(ForecastViewInteractorNumberOfDays);
    parameters.latitude = latitude;
    parameters.longitude = longitude;
    
    __weak ForecastViewInteractor *weakSelf = self;
    [manager fetchForecastRemoteInformationWithParameters:parameters withCompletion:^(Forecast * forecast, NSError *error) {
        
        if (error) {
            [weakSelf.delegate forecastViewInteractor:weakSelf didFailFetchingForecastWithError:error];
        } else {
            weakSelf.cachedForecast = forecast;
            [weakSelf.delegate forecastViewInteractor:weakSelf didFetchForecast:forecast];
        }
        
    }];
}


@end
