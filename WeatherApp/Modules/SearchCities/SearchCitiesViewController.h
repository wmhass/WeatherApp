//
//  SearchCitiesViewController.h
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *  const SearchCitiesViewControllerIdentifier;

@class CitiesListDisplayData, SearchCitiesPresenter;
@interface SearchCitiesViewController : UIViewController

@property (strong, nonatomic) SearchCitiesPresenter *  presenter;

- (void)reloadAllData;
- (void)presentErrorMessage:(NSString * )errorMessage;
- (void)displayData:(CitiesListDisplayData * )listDisplayData;
- (void)displayNoCitiesFound;
- (void)presentEmptySearchTextMessage;
- (void)presentLoadingContent;

@end
