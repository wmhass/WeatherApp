//
//  ForecastViewInteractorTests.m
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ForecastViewInteractor.h"
#import "WorldWeatherDataManager.h"
#import "Forecast.h"

@interface ForecastViewInteractorTests : XCTestCase

@property (strong, nonatomic) ForecastViewInteractor *interactor;
@property (strong, nonatomic) id interactorDelegate;
@property (strong, nonatomic) id dataManager;

@end

@implementation ForecastViewInteractorTests

- (void)setUp {
    [super setUp];
    
    self.interactorDelegate = [OCMockObject mockForProtocol:@protocol(ForecastViewInteractorDelegate)];
    self.dataManager = [OCMockObject mockForClass:[WorldWeatherDataManager class]];
    
    self.interactor = [[ForecastViewInteractor alloc] init];
    self.interactor.dataManager = self.dataManager;
    self.interactor.delegate = self.interactorDelegate;
}

- (void)tearDown {
    [super tearDown];
    [self.interactorDelegate verify];
    [self.dataManager verify];
}

- (void)testFailLoadingForecast {
    NSError *error = [OCMockObject mockForClass:[NSError class]];
    
    [self dataStoreWillReturnError:error];
    
    [[self.interactorDelegate expect] forecastViewInteractor:self.interactor didFailFetchingForecastWithError:error];
    
    [self.interactor loadForecastForLatitude:OCMOCK_ANY longitude:OCMOCK_ANY];
}

- (void)testLoadNonEmptyForecast {
    
    Forecast *forecast = [OCMockObject mockForClass:[Forecast class]];
    
    [self dataStoreWillReturnForecast:forecast];
    
    [[self.interactorDelegate expect] forecastViewInteractor:self.interactor didFetchForecast:forecast];
    
    [self.interactor loadForecastForLatitude:OCMOCK_ANY longitude:OCMOCK_ANY];

}

- (void)dataStoreWillReturnForecast:(Forecast *)forecast {
    [self dataStoreWillReturnForecast:forecast error:nil];
}

- (void)dataStoreWillReturnError:(NSError *)error {
    [self dataStoreWillReturnForecast:nil error:error];
}

- (void)dataStoreWillReturnForecast:(Forecast *)forecast error:(NSError *)error {
    [[[self.dataManager stub] andDo:^(NSInvocation *invocation) {
        
        WorldWeatherDataManagerForecastCompletionBlock completionBlock;
        [invocation getArgument:&completionBlock atIndex:3];
        completionBlock(forecast,error);
        
    }] fetchForecastRemoteInformationWithParameters:OCMOCK_ANY withCompletion:OCMOCK_ANY];
}

@end
