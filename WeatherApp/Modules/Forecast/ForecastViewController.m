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

NSString * const ForecastViewSearchSegueIdentifier = @"search_segue";
NSString * const ForecastViewControllerTableHeaderReuseIdentifier = @"table_header";

@interface ForecastViewController () <UITableViewDataSource, UITableViewDelegate, UIHourlyConditionTableViewHeaderViewDataSource>

@property (strong, nonatomic) ForecastDisplayData *displayData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *currentLocation;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherDescription;
@property (weak, nonatomic) IBOutlet UILabel *currentTemperature;

@end

@implementation ForecastViewController

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidLoad];
    [self setupTableView];
    [self.presenter doInitialLoad];
}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - Public

- (void)reloadAllData {
    [self.tableView reloadData];
}

- (void)displayData:(ForecastDisplayData * _Nullable)displayData {
    self.displayData = displayData;
    [self updateHeaderInformation];
}

- (NSString * _Nullable)searchingCity {
    // TODO: Pass search string
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

- (NSInteger)selectedMetric {
    return 0;
}

#pragma mark - Private

- (void)updateHeaderInformation {
    self.currentLocation.text = [self.displayData currentLocation];
    self.currentTemperature.text = [self.displayData currentTemperature];
    self.currentWeatherDescription.text = [self.displayData currentWeatherDescription];
}

- (void)setupTableView {
    // Adding a blank view as a tableFooterView removes all the extra empty cells
    self.tableView.tableFooterView = [UIView new];
    UINib *headerNib = [UINib nibWithNibName:UIHourlyConditionTableViewHeaderViewNibName bundle:nil];
    [self.tableView registerNib:headerNib forHeaderFooterViewReuseIdentifier:ForecastViewControllerTableHeaderReuseIdentifier];
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

@end
