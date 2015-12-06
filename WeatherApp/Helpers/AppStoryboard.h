//
//  AppStoryboard.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppStoryboard : NSObject

+ (instancetype )sharedInstance;
- (UIViewController * )initialViewController;
- (UIViewController * )viewControllerWithIdentifier:(NSString * )controllerIdentifier;
@end
