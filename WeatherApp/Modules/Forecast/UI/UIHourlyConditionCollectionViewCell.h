//
//  UIHourlyConditionCollectionViewCell.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *  const UIHourlyConditionCollectionViewCellReuseIdentifier;
extern NSString *  const UIHourlyConditionCollectionViewCellNibName;

@interface UIHourlyConditionCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic, readonly) UILabel *  timeLabel;
@property (strong, nonatomic, readonly) UILabel *  temperatureLabel;

@end
