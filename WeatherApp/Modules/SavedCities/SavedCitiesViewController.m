//
//  SavedCitiesViewController.m
//  WeatherApp
//
//  Created by William Hass on 12/6/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SavedCitiesViewController.h"
#import "CitiesListDisplayData.h"
#import "UICityTableViewCell.h"
#import "CityDisplayData.h"
#import "SavedCitiesPresenter.h"

NSString * const SavedCitiesViewControllerIdentifier = @"SavedCitiesViewController";

@interface SavedCitiesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *emptyMessageLabel;
@property (strong, nonatomic) IBOutlet UIView *tableFooterView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomKeylineHeightConstraint;
@property (strong, nonatomic) CitiesListDisplayData *listDisplay;

@end

@implementation SavedCitiesViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self localizeView];
    [self setupTableView];
    self.bottomKeylineHeightConstraint.constant = .5f;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.presenter loadData];
}

#pragma mark - Public

- (void)displayCitiesList:(CitiesListDisplayData * )listDisplayData {
    self.listDisplay = listDisplayData;
}

- (void)reloadAllData {
    [self.tableView reloadData];
}

- (void)presentEmptySavedCities {
    self.tableView.tableFooterView = self.tableFooterView;
}

#pragma mark - IBActions

- (IBAction)btnCloseTouched:(id)sender {
    [self.presenter didTapCloseButton];
}

#pragma mark - Private

- (void)localizeView {
    [self.closeButton setTitle:NSLocalizedString(@"CLOSE", nil) forState:UIControlStateNormal];
    self.titleLabel.text = NSLocalizedString(@"SAVED_CITIES_VIEW_TITLE", nil);
    self.emptyMessageLabel.text = NSLocalizedString(@"NO_CITIES_SAVED", nil);
}

- (void)setupTableView {
    self.tableView.tableFooterView = [UIView new];
    self.tableView.estimatedRowHeight = 120;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listDisplay numberOfCities];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UICityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UICityTableViewCellReuseIdentifier];
    
    CityDisplayData *cityDisplay = [self.listDisplay cityDisplayDataAtIndex:indexPath.row];
    cell.cityInformationLabel.text = cityDisplay.description;
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [self.presenter didSelectCityDisplay:[self.listDisplay cityDisplayDataAtIndex:indexPath.row]];
}

@end
