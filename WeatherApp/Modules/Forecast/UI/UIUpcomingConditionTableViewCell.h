//
//  UIUpcomingConditionTableViewCell.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const UIUpcomingConditionTableViewCellReuseIdentifier;

@interface UIUpcomingConditionTableViewCell : UITableViewCell

@property (weak, nonatomic, readonly) UILabel *weekDayLabel;
@property (weak, nonatomic, readonly) UILabel *minTempLabel;
@property (weak, nonatomic, readonly) UILabel *maxTempLabel;

@end
