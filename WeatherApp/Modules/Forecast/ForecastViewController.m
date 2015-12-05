//
//  ForecastViewController.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "ForecastViewController.h"
#import "ForecastViewPresenter.h"
#import "ForecastDisplayData.h"

NSString * const ForecastViewSearchSegueIdentifier = @"search_segue";

@interface ForecastViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchLabelBottomConstraint;
@property (strong, nonatomic) ForecastDisplayData *displayData;

@end

@implementation ForecastViewController

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
    [self.presenter doInitialLoad];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Private


#pragma mark - Public

- (void)displayData:(ForecastDisplayData * _Nullable)displayData {
    self.displayData = displayData;
}

- (NSString * _Nullable)searchingCity {
    return @"Porto alegre";
}


- (void)presentErrorMessage:(NSString * _Nonnull)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"ERROR_ALERT", @"Ooops!") message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"Ok") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
