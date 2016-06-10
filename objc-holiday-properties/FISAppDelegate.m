//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)holidaysInSeason:(NSString *)season {
    
    NSArray *allHolidaysKeys = [self.database[season]allKeys];
    
    return allHolidaysKeys;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    
    NSMutableArray *suppliesForHolidayAndSeason = [[NSMutableArray alloc]initWithArray:self.database[season][holiday] copyItems:YES];
    
    return suppliesForHolidayAndSeason;

}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    
    BOOL seasonHoliday = [[self.database[season]allKeys] containsObject:holiday];
    
    return seasonHoliday;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    
    BOOL supplyStringInSeasonInHoliday = [self.database[season][holiday]containsObject:supply];
    
    return supplyStringInSeasonInHoliday;

}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    
    NSMutableArray *newKeyValueHoliday = [[NSMutableArray alloc]init];
    
    [self.database[season] setValue:newKeyValueHoliday forKey:holiday];
    
    // no return
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    
    [self.database[season] setValue:supply forKey:holiday];
    
    // no return
}

@end
