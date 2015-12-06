//
//  UICityTableViewCell.h
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *  const UICityTableViewCellReuseIdentifier;

@interface UICityTableViewCell : UITableViewCell

@property (weak, nonatomic, readonly) UILabel *  cityInformationLabel;

@end
