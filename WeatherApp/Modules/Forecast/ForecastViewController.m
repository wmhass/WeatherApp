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
#import "ForecastUpcomingConditionDisplayData.h"
#import "UIUpcomingConditionTableViewCell+ForecastUpcomingConditionDisplayData.h"
#import "UIHourlyConditionTableViewHeaderView.h"
#import "CityDisplayData.h"
#import "CitiesListDisplayData.h"
#import "SearchCitiesViewController.h"

NSString * const ForecastViewMyCitiesSegue = @"my_cities_segue";
NSString * const ForecastViewControllerTableHeaderReuseIdentifier = @"table_header";

@interface ForecastViewController () <UITableViewDataSource, UITableViewDelegate, UIHourlyConditionTableViewHeaderViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) ForecastDisplayData * _Nullable displayData;
@property (strong, nonatomic) CityDisplayData * _Nullable currentCity;
@property (weak, nonatomic) IBOutlet UIView *noCitiesView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *noCitiesViewLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLocation;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherDescription;
@property (weak, nonatomic) IBOutlet UILabel *currentTemperature;
@property (weak, nonatomic) IBOutlet UIButton *cancelSearchButton;
@property (weak, nonatomic) IBOutlet UIButton *saveCityButton;
@property (weak, nonatomic) IBOutlet UIButton *removeCityButton;
@property (weak, nonatomic) IBOutlet UIView *searchCityContainer;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchTextContainerTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchTextContainerBottomConstraint;
@property (weak, nonatomic) IBOutlet UISegmentedControl *metricsSegmentedControl;
@end

@implementation ForecastViewController

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupTableView];

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self.presenter doInitialLoad];
    });
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    if ([segue.identifier isEqualToString:ForecastViewMyCitiesSegue]) {
        [self.presenter willPresentMyCitiesView:(SavedCitiesViewController *)segue.destinationViewController];
    }
}


#pragma mark - Public

- (CityDisplayData * _Nullable)presentingCity {
    return self.currentCity;
}

- (void)presentNoCitiesFoundMessage:(NSString * _Nonnull)message {
    self.noCitiesView.hidden = NO;
    self.noCitiesViewLabel.text = message;
}


- (void)reloadAllData {
    [self.tableView reloadData];
}

- (void)displayForecastData:(ForecastDisplayData * _Nullable)displayData {
    self.noCitiesView.hidden = YES;
    self.displayData = displayData;
    [self updateHeaderInformation];
}

- (void)presentErrorMessage:(NSString * _Nonnull)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"ERROR_ALERT", @"Ooops!") message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"Ok") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (NSInteger)selectedMetric {
    return self.metricsSegmentedControl.selectedSegmentIndex;
}

- (void)presentSearchCitiesView:(SearchCitiesViewController * _Nonnull)viewController {
    [self addViewControllerToContainer:viewController];
    [self raiseContainerViewAnimated];
}

- (void)dismissSearchCitiesView {
    self.searchTextField.text = nil;
    [self.searchTextField resignFirstResponder];
    [self fallContainerViewAnimatedWithCompletion:^{
        [self.searchCityContainer.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }];
}

- (NSString * _Nullable)searchingCityString {
    return self.searchTextField.text;
}

- (void)displayCity:(CityDisplayData * _Nonnull)cityDisplay {
    self.currentCity = cityDisplay;
    [self updateHeaderInformation];
}

#pragma mark - Private

- (void)raiseContainerViewAnimated {
    [self.view layoutIfNeeded];
    
    self.searchTextContainerBottomConstraint.priority = UILayoutPriorityDefaultLow;
    self.searchTextContainerTopConstraint.priority = UILayoutPriorityDefaultHigh;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.cancelSearchButton.alpha = 1;
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)fallContainerViewAnimatedWithCompletion:(void(^)(void))completion {
    [self.view layoutIfNeeded];
    
    self.searchTextContainerBottomConstraint.priority = UILayoutPriorityDefaultHigh;
    self.searchTextContainerTopConstraint.priority = UILayoutPriorityDefaultLow;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.cancelSearchButton.alpha = 0;
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)addViewControllerToContainer:(UIViewController *)viewController {
    [viewController willMoveToParentViewController:self];
    viewController.view.frame = self.searchCityContainer.bounds;
    viewController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    viewController.view.translatesAutoresizingMaskIntoConstraints = YES;
    [self.searchCityContainer addSubview:viewController.view];
    [self addChildViewController:viewController];
    [viewController didMoveToParentViewController:self];
}

- (void)updateHeaderInformation {
    //TODO: Remove currentLocation from displayData, we already have this data in the currentCity property
    self.currentLocation.text = self.currentCity.description;
    self.currentTemperature.text = [self.displayData currentTemperature];
    self.currentWeatherDescription.text = [self.displayData currentWeatherDescription];
    
    BOOL cityIsSaved = self.currentCity.saved;
    self.saveCityButton.hidden = cityIsSaved;
    self.removeCityButton.hidden = !cityIsSaved;
}

- (void)setupTableView {
    // Adding a blank view as a tableFooterView removes all the extra empty cells
    self.tableView.tableFooterView = [UIView new];
    UINib *headerNib = [UINib nibWithNibName:UIHourlyConditionTableViewHeaderViewNibName bundle:nil];
    [self.tableView registerNib:headerNib forHeaderFooterViewReuseIdentifier:ForecastViewControllerTableHeaderReuseIdentifier];
}

#pragma mark - IBActions

- (IBAction)segmentedControlValueChanged:(id)sender {
    [self.presenter metricValueChanged];
}

- (IBAction)cancelButtonTouched:(id)sender {
    [self.presenter cancelCitySearch];
}

- (IBAction)searchTextChanged:(id)sender {
    [self.presenter citySearchTextChanged];
}

- (IBAction)btnSaveTouched:(id)sender {
    [self.presenter saveCity];
}

- (IBAction)btnRemoveCityTouched:(id)sender {
    [self.presenter removeCity];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.displayData numberOfUpcomingConditions];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIUpcomingConditionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UIUpcomingConditionTableViewCellReuseIdentifier];
    
    ForecastUpcomingConditionDisplayData *displayData = [self.displayData upcomingConditionDisplayDataAtIndex:indexPath.row];
    
    [cell displayUpcomingCondition:displayData];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIHourlyConditionTableViewHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ForecastViewControllerTableHeaderReuseIdentifier];
    
    header.dataSource = self;
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}


#pragma mark - UIHourlyConditionTableViewHeaderViewDataSource

- (NSInteger)numberOfHourlyConditionsForHourlyConditionHeaderView:(UIHourlyConditionTableViewHeaderView *)headerView {
    return [self.displayData numberOfHourlyConditionsForCurrentCondition];
}

- (ForecastHourlyConditionDisplayData *)hourlyConditionHeaderView:(UIHourlyConditionTableViewHeaderView *)haderView hourlyConditionDisplayDataAtIndex:(NSInteger)index {
    return [self.displayData hourlyConditionDisplayDataAtIndex:index];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    // The presenter will load the search view and ask this view to present the VC in its container
    return [self.presenter canStartSearchingCity];
}

@end
