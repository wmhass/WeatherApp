//
//  AppStoryboard.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppStoryboard : NSObject

+ (instancetype _Nonnull)sharedInstance;
- (UIViewController * _Nonnull)initialViewController;
- (UIViewController * _Nullable)viewControllerWithIdentifier:(NSString * _Nonnull)controllerIdentifier;
@end
