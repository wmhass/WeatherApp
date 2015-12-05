//
//  UIHourlyConditionCollectionViewCell.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "UIHourlyConditionCollectionViewCell.h"

NSString * const UIHourlyConditionCollectionViewCellNibName = @"UIHourlyConditionCollectionViewCell";
NSString * const UIHourlyConditionCollectionViewCellReuseIdentifier = @"UIHourlyConditionCollectionViewCell";

@interface UIHourlyConditionCollectionViewCell()

@property (strong, nonatomic) IBOutlet UILabel * timeLabel;
@property (strong, nonatomic) IBOutlet UILabel * temperatureLabel;

@end

@implementation UIHourlyConditionCollectionViewCell

- (void)awakeFromNib {

}

@end
