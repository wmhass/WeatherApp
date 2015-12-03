//
//  ForecastViewController.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewController.h"
#import "ForecastViewPresenter.h"

NSString * const ForecastViewSearchSegueIdentifier = @"search_segue";

@interface ForecastViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchLabelBottomConstraint;

@end

@implementation ForecastViewController

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
    [self setupKeyboardListener];
    [self.presenter doInitialLoad];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:ForecastViewSearchSegueIdentifier]) {
        _searchCitiesController = (SearchCitiesViewController *)segue.destinationViewController;
    }
}



- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private

- (void)setupKeyboardListener {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWillAppear:(NSNotification *)notification {
    self.searchLabelBottomConstraint.priority = UILayoutPriorityDefaultLow;
}


@end
