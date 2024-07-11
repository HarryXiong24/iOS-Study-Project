//
//  Location.m
//  AppDemo
//

#import "Location.h"
#import <CoreLocation/CoreLocation.h>

@interface Location () <CLLocationManagerDelegate>


@property(nonatomic, strong, readwrite) CLLocationManager *manager;

@end

@implementation Location

+ (Location *)locationManager {
	static Location *location;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		location = [[Location alloc] init];
	});
	return location;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		self.manager = [[CLLocationManager alloc] init];
		self.manager.delegate = self;
	}
	return self;
}


- (void)checkLocationAuthorization {

	// determine if service is open
	if(![CLLocationManager locationServicesEnabled]) {
		// prompt guideline
	}

	if([self.manager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
		[self.manager requestWhenInUseAuthorization];
	} else if ([self.manager authorizationStatus] == kCLAuthorizationStatusDenied) {
		// Handle denied status
		NSLog(@"Location services are denied");
	} else if ([self.manager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse ||
	           [self.manager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways) {
		[self.manager startUpdatingLocation];
	}

}

#pragma mark - delegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
	if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
		[self.manager startUpdatingLocation];

	}else if (status == kCLAuthorizationStatusDenied) {
		NSLog(@"Location services are denied");
	}
}

- (void)locationManager:(CLLocationManager *)manager
        didUpdateLocations:(NSArray<CLLocation *> *)locations {

	// 地理信息
	CLLocation *location = [locations firstObject];

	CLGeocoder *coder = [[CLGeocoder alloc] init];

	[coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
	         // 地标信息
	 }];

	[self.manager stopUpdatingLocation];
}


@end
