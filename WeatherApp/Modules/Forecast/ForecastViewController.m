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
#import "UIUpcomingConditionTableViewCell+ForecastUpcomingConditionDisplayData.h"
#import "UIHourlyConditionTableViewHeaderView.h"
#import "CityDisplayData.h"
#import "SearchCitiesViewController.h"

NSString * const ForecastViewControllerTableHeaderReuseIdentifier = @"table_header";

@interface ForecastViewController () <UITableViewDataSource, UITableViewDelegate, UIHourlyConditionTableViewHeaderViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) ForecastDisplayData *displayData;
@property (strong, nonatomic) CityDisplayData *currentCity;

@property (weak, nonatomic) IBOutlet UIView *noCitiesView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *searchCityContainer;
@property (weak, nonatomic) IBOutlet UIView *loadingContainerView;

@property (weak, nonatomic) IBOutlet UIButton *cancelSearchButton;
@property (weak, nonatomic) IBOutlet UIButton *saveCityButton;
@property (weak, nonatomic) IBOutlet UIButton *removeCityButton;
@property (weak, nonatomic) IBOutlet UIButton *myCitiesButton;

@property (weak, nonatomic) IBOutlet UILabel *noCitiesViewLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLocation;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherDescription;
@property (weak, nonatomic) IBOutlet UILabel *currentTemperature;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchTextContainerTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchTextContainerBottomConstraint;
@property (strong, nonatomic) IBOutletCollection(NSLayoutConstraint) NSArray *keylinesHeightConstraints;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinnerView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *metricsSegmentedControl;

@end

@implementation ForecastViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupSearchTextField];
    [self setupKeylines];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.presenter viewWillAppear];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


#pragma mark - Public

- (UIView *)viewForPresentingSearchController {
    return self.searchCityContainer;
}

- (CityDisplayData * )presentingCity {
    return self.currentCity;
}

- (void)presentEmptySavedCities {
    self.metricsSegmentedControl.enabled = NO;
    [self showEmptyStateLabelWithMessage:NSLocalizedString(@"NO_CITIES_MESSAGE", nil)];
}

- (void)reloadAllData {
    [self.tableView reloadData];
}

- (void)displayForecast:(ForecastDisplayData * )displayData {
    self.noCitiesView.hidden = YES;
    self.displayData = displayData;
    self.metricsSegmentedControl.enabled = YES;
    [self updateHeaderInformation];
}

- (void)presentErrorMessage:(NSString * )message {
    [self showEmptyStateLabelWithMessage:message];
}

- (NSInteger)selectedMetric {
    return self.metricsSegmentedControl.selectedSegmentIndex;
}

- (void)presentSearchCitiesView {
    [self raiseContainerViewAnimated];
}

- (void)dismissSearchCitiesView {
    self.searchTextField.text = nil;
    [self.searchTextField resignFirstResponder];
    [self fallContainerViewAnimatedWithCompletion:^{
        [self.searchCityContainer.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }];
}

- (NSString * )searchingCityString {
    return self.searchTextField.text;
}

- (void)displayCity:(CityDisplayData * )cityDisplay {
    self.currentCity = cityDisplay;
    [self updateHeaderInformation];
}

- (void)showLoadingView {
    [self.spinnerView startAnimating];
    self.loadingContainerView.alpha = 1;
}

- (void)hideLoadingView {
    [UIView animateWithDuration:0.2 animations:^{
        self.loadingContainerView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.spinnerView stopAnimating];
    }];
}


#pragma mark - Private

- (void)showEmptyStateLabelWithMessage:(NSString *)message {
    self.noCitiesView.hidden = NO;
    self.noCitiesViewLabel.text = message;
}

- (void)localizeView {
    [self.myCitiesButton setTitle:NSLocalizedString(@"MY_CITIES_BUTTON", nil) forState:UIControlStateNormal];
    [self.saveCityButton setTitle:NSLocalizedString(@"SAVE_CITY_BUTTON", nil) forState:UIControlStateNormal];
    [self.removeCityButton setTitle:NSLocalizedString(@"REMOVE_CITY_BUTTON", nil) forState:UIControlStateNormal];
    [self.cancelSearchButton setTitle:NSLocalizedString(@"CANCEL", nil) forState:UIControlStateNormal];
}

- (void)raiseContainerViewAnimated {
    [self.view layoutIfNeeded];
    
    self.searchTextContainerBottomConstraint.priority = UILayoutPriorityDefaultLow;
    self.searchTextContainerTopConstraint.priority = UILayoutPriorityDefaultHigh;
    
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
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

- (void)updateHeaderInformation {
    self.currentLocation.text = self.currentCity.description ?: @"--";
    self.currentTemperature.text = [self.displayData currentTemperature] ?: @"--";
    self.currentWeatherDescription.text = [self.displayData currentWeatherDescription] ?: @"--";
    
    BOOL cityIsSaved = self.currentCity.saved;

    self.saveCityButton.hidden = cityIsSaved;
    self.removeCityButton.hidden = !cityIsSaved;
}

- (void)setupTableView {
    self.tableView.tableFooterView = [UIView new];
    UINib *headerNib = [UINib nibWithNibName:UIHourlyConditionTableViewHeaderViewNibName bundle:nil];
    [self.tableView registerNib:headerNib forHeaderFooterViewReuseIdentifier:ForecastViewControllerTableHeaderReuseIdentifier];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
}

- (void)setupSearchTextField {
    UIImage *searchImage = [[UIImage imageNamed:@"search_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *leftAccessory = [[UIImageView alloc] initWithImage:searchImage];
    leftAccessory.contentMode = UIViewContentModeCenter;
    leftAccessory.frame = CGRectMake(0, 0, searchImage.size.width, CGRectGetHeight(self.searchTextField.frame));
    self.searchTextField.leftView = leftAccessory;
    self.searchTextField.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setupKeylines {
    [self.keylinesHeightConstraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *_Nonnull constraint, NSUInteger idx, BOOL * _Nonnull stop) {
        constraint.constant = .5f;
    }];
}


#pragma mark - IBActions

- (IBAction)segmentedControlValueChanged:(id)sender {
    [self.presenter metricValueChanged];
}

- (IBAction)cancelButtonTouched:(id)sender {
    [self.presenter didTapCancelSearchButton];
}

- (IBAction)searchTextChanged:(id)sender {
    [self.presenter citySearchTextChanged];
}

- (IBAction)btnSaveTouched:(id)sender {
    [self.presenter didTapSaveCityButton];
}

- (IBAction)btnRemoveCityTouched:(id)sender {
    [self.presenter didTapRemoveCityButton];
}

- (IBAction)btnMyCitiesTouched:(id)sender {
    [self.presenter didTapMyCitiesButton];
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

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self.presenter didStartTypingCitySearch];
}

@end
