//
//  SearchCitiesViewController.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CitiesListDisplayData;
@interface SearchCitiesViewController : UIViewController

- (void)reloadAllData;
- (void)presentSearchEmptyMessage;
- (void)presentErrorMessage:(NSString * _Nonnull)errorMessage;
- (void)displayData:(CitiesListDisplayData * _Nonnull)listDisplayData;
- (NSString * _Nullable)searchingTerm;

@end
