//
//  SearchCitiesViewController.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * _Nonnull const SearchCitiesViewControllerIdentifier;

@class CitiesListDisplayData, SearchCitiesPresenter;
@interface SearchCitiesViewController : UIViewController

@property (strong, nonatomic) SearchCitiesPresenter * _Nonnull presenter;

- (void)reloadAllData;
- (void)presentErrorMessage:(NSString * _Nonnull)errorMessage;
- (void)displayData:(CitiesListDisplayData * _Nonnull)listDisplayData;
- (void)displayNoCitiesFound;
- (void)presentEmptySearchTextMessage;

@end
