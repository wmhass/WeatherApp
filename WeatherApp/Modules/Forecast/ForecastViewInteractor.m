//
//  ForecastViewInteractor.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewInteractor.h"
#import "WorldWeatherDataManager.h"
#import "Forecast.h"

static NSInteger const ForecastViewInteractorNumberOfDays = 5;

@interface ForecastViewInteractor()

@property (strong, nonatomic) Forecast *cachedForecast;
@property (strong, nonatomic) WorldWeatherDataManager *dataManager;

@end

@implementation ForecastViewInteractor

#pragma mark - Initializers

- (id)init {
    self = [super init];
    if(self) {
        _dataManager = [[WorldWeatherDataManager alloc] init];
    }
    return self;
}


#pragma mark - Public 

- (void)loadForecastForLatitude:(NSString *)latitude longitude:(NSString *)longitude {
    
    WorldWeatherDataManagerParameters *parameters = [[WorldWeatherDataManagerParameters alloc] init];
    parameters.numberOfDays = @(ForecastViewInteractorNumberOfDays);
    parameters.latitude = latitude;
    parameters.longitude = longitude;
    
    __weak ForecastViewInteractor *weakSelf = self;
    [self.dataManager fetchForecastRemoteInformationWithParameters:parameters withCompletion:^(Forecast * forecast, NSError *error) {
        
        if (error) {
            [weakSelf.delegate forecastViewInteractor:weakSelf didFailFetchingForecastWithError:error];
        } else {
            weakSelf.cachedForecast = forecast;
            [weakSelf.delegate forecastViewInteractor:weakSelf didFetchForecast:forecast];
        }
        
    }];
}


@end
