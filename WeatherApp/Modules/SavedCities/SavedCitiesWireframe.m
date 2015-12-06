//
//  SavedCitiesWireframe.m
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SavedCitiesWireframe.h"
#import "SavedCitiesViewController.h"
#import "SavedCitiesPresenter.h"
#import "SavedCitiesInteractor.h"

@interface SavedCitiesWireframe()

@property (weak, nonatomic) SavedCitiesViewController * _Nullable presentingView;

@end

@implementation SavedCitiesWireframe

#pragma mark - Public

- (void)setupSavedCitiesView:(SavedCitiesViewController * _Nonnull)savedCitiesView {
    savedCitiesView.presenter = [[SavedCitiesPresenter alloc] init];
    savedCitiesView.presenter.savedCitiesView = savedCitiesView;
    savedCitiesView.presenter.savedCitiesWireframe = self;
    savedCitiesView.presenter.savedCitiesInteractor = [[SavedCitiesInteractor alloc] init];
    
    self.presentingView = savedCitiesView;
}

- (void)closeView {
    [self.presentingView dismissViewControllerAnimated:YES completion:nil];
}

@end
