//
//  SavedCitiesWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SavedCitiesWireframe.h"
#import "SavedCitiesViewController.h"
#import "SavedCitiesInteractor.h"
#import "AppStoryboard.h"

@interface SavedCitiesWireframe()

@property (weak, nonatomic) SavedCitiesViewController *presentingView;

@end

@implementation SavedCitiesWireframe

#pragma mark - Public

- (void)presentInViewControllerContext:(UIViewController *)context delegate:(id<SavedCitiesPresenterDelegate>)delegate {
    SavedCitiesViewController *savedCitiesView = (SavedCitiesViewController *)[[AppStoryboard sharedInstance] viewControllerWithIdentifier:SavedCitiesViewControllerIdentifier];
    
    savedCitiesView.presenter = [[SavedCitiesPresenter alloc] init];
    savedCitiesView.presenter.delegate = delegate;
    savedCitiesView.presenter.savedCitiesView = savedCitiesView;
    savedCitiesView.presenter.savedCitiesWireframe = self;
    savedCitiesView.presenter.savedCitiesInteractor = [[SavedCitiesInteractor alloc] init];
    
    [context presentViewController:savedCitiesView animated:YES completion:nil];
    
    self.presentingView = savedCitiesView;
}

- (void)closeView {
    [self.presentingView dismissViewControllerAnimated:YES completion:nil];
}

@end
