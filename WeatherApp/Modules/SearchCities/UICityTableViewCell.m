//
//  UICityTableViewCell.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "UICityTableViewCell.h"

NSString * const UICityTableViewCellReuseIdentifier = @"CityDisplayTableViewCell";

@interface UICityTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel * cityInformationLabel;

@end

@implementation UICityTableViewCell

#pragma mark - Private

- (void)resetContent {
    [self setSelected:NO animated:NO];
    self.cityInformationLabel.text = nil;
    
}


#pragma mark - Lifecycle

- (void)prepareForReuse {
    [self resetContent];
}

- (void)awakeFromNib {
    [self resetContent];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
