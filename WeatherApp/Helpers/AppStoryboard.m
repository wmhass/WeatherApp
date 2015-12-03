//
//  AppStoryboard.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "AppStoryboard.h"

NSString * const AppStoryboardMainStoryBoard = @"Main";

@interface AppStoryboard()

@property (strong, nonatomic) UIStoryboard *mainStoryBoard;

@end

@implementation AppStoryboard

#pragma mark - Initializers

- (id)init {
    self = [super init];
    if(self) {
        _mainStoryBoard = [UIStoryboard storyboardWithName:AppStoryboardMainStoryBoard bundle:[NSBundle mainBundle]];
    }
    return self;
}

+ (instancetype)sharedInstance {
    static AppStoryboard *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AppStoryboard alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Public

- (MMDrawerController *)initialViewController {
    return (MMDrawerController *)[self.mainStoryBoard instantiateInitialViewController];
}

@end
