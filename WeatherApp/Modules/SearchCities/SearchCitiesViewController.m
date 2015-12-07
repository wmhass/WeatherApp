//
//  SearchCitiesViewController.m
//  WeatherApp
//
//  Created by William Hass on 12/3/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SearchCitiesViewController.h"
#import "UICityTableViewCell.h"
#import "CitiesListDisplayData.h"
#import "CityDisplayData.h"
#import "SearchCitiesPresenter.h"

NSString * const SearchCitiesViewControllerIdentifier = @"SearchCitiesViewController";

@interface SearchCitiesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinnerView;
@property (weak, nonatomic) IBOutlet UILabel *footerEmptyStateLabel;
@property (strong, nonatomic) IBOutlet UIView *tableHeaderView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) CitiesListDisplayData *displayData;

@end

@implementation SearchCitiesViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self presentEmptySearchTextMessage];
}

#pragma mark - Private

- (void)setupTableView {
    self.tableView.estimatedRowHeight = 120;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.tableFooterView = [UIView new];
}

- (void)presentFooterMessage {
    self.tableView.tableHeaderView = self.tableHeaderView;
    self.footerEmptyStateLabel.alpha = 1;
    [self.spinnerView stopAnimating];
}

#pragma mark - Public

- (void)presentLoadingContent {
    self.tableView.tableHeaderView = self.tableHeaderView;
    self.footerEmptyStateLabel.alpha = 0;
    [self.spinnerView startAnimating];
}

- (void)presentEmptySearchTextMessage {
    [self presentFooterMessage];
    self.footerEmptyStateLabel.text = NSLocalizedString(@"SEARCH_PLACEHOLDER", nil);
}

- (void)displayNoCitiesFoundMessage {
    [self presentFooterMessage];
    self.footerEmptyStateLabel.text = NSLocalizedString(@"NO_CITIES_FOUND", nil);
}

- (void)presentErrorMessage:(NSString * )errorMessage {
    [self presentFooterMessage];
    self.footerEmptyStateLabel.text = errorMessage;
}

- (void)displayData:(CitiesListDisplayData * )listDisplayData {
    self.tableView.tableHeaderView = nil;
    self.displayData = listDisplayData;
}

- (void)reloadAllData {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.displayData.numberOfCities;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UICityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UICityTableViewCellReuseIdentifier];
    
    cell.cityInformationLabel.text = [self.displayData cityDisplayDataAtIndex:indexPath.row].description;
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.presenter didSelectCityDisplayData:[self.displayData cityDisplayDataAtIndex:indexPath.row]];
}

@end
