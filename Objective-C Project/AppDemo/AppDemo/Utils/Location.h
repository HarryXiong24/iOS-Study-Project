//
//  Location.h
//  AppDemo
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Location : NSObject

+ (Location *)locationManager;

- (void)checkLocationAuthorization;

@end

NS_ASSUME_NONNULL_END
