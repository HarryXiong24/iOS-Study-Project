//
//  ListLoader.h
//  AppDemo
//

#import <Foundation/Foundation.h>
#import "../Models/Weather.h"

NS_ASSUME_NONNULL_BEGIN

@interface ListLoader : NSObject

- (void)loadData:(void (^)(WeatherData *weatherData, NSError *error))completion;

@end

NS_ASSUME_NONNULL_END
