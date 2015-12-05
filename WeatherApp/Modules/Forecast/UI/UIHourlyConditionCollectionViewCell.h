//
//  UIHourlyConditionCollectionViewCell.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * _Nonnull const UIHourlyConditionCollectionViewCellReuseIdentifier;
extern NSString * _Nonnull const UIHourlyConditionCollectionViewCellNibName;

@interface UIHourlyConditionCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic, readonly) UILabel * _Nonnull timeLabel;
@property (strong, nonatomic, readonly) UILabel * _Nonnull temperatureLabel;

@end
