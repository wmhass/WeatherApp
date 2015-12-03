//
//  ForecastDataManagerTests.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ForecastDataManager.h"

@interface ForecastDataManagerTests : XCTestCase

@property (strong, nonatomic) ForecastDataManager *dataManager;

@end

@implementation ForecastDataManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.dataManager = [[ForecastDataManager alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLoadRemoteData {
    
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

/*- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}*/

@end
