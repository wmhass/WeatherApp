//
//  SavedCitiesDataManager.m
//  WeatherApp
//
//  Created by William Hass on 12/5/15.
//  Copyright © 2015 William Hass. All rights reserved.
//

#import "SavedCitiesDataManager.h"

static NSString * const SavedCitiesFileName = @"saved_cities";

@implementation SavedCitiesDataManager

#pragma mark - Private

- (NSString *)filePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = paths[0];
    
    return [documentsPath stringByAppendingPathComponent:SavedCitiesFileName];
}

#pragma mark - Public

- (NSArray <City *> *  )loadStoredCities {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
}

- (BOOL)storeCities:(NSArray <City *> * )cities {
    return [NSKeyedArchiver archiveRootObject:cities toFile:[self filePath]];
}



@end
