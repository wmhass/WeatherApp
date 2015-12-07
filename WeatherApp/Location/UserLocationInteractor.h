//
//  UserLocationInteractor.h
//  WeatherApp
//
//  Created by William Hass on 12/7/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserLocationInteractor, UserLocation;
@protocol UserLocationInteractorDelegate <NSObject>

- (void)userLocationInteractor:(UserLocationInteractor *)interactor didFetchUserLocation:(UserLocation *)userLocation;

@end

@interface UserLocationInteractor : NSObject

@property (weak, nonatomic) id<UserLocationInteractorDelegate> delegate;

- (void)fetchUserLocation;

@end
