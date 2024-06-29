//
//  ListLoader.m
//  AppDemo
//

#import "ListLoader.h"
#import <AFNetworking.h>
#import "../Models/Weather.h"

@implementation ListLoader

- (void)loadData:(void (^)(WeatherData *weatherData, NSError *error))completion {


	[[AFHTTPSessionManager manager] GET:@"https://api.openweathermap.org/data/2.5/weather?appid=6f2c843f65a34256d86a30d54be8d6a4&units=metric&q=London" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
	         NSLog(@"%@", responseObject);

	         WeatherData *weatherData = [[WeatherData alloc] initWithDictionary:responseObject];

	         NSLog(@"Name: %@", weatherData.name);
	         NSLog(@"Temperature: %f", weatherData.main.temp);

	         [self _getSandBoxPath:weatherData];

	         if (completion) {
			 completion(weatherData, nil);
		 }

	 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
	         NSLog(@"%@", error);
	 }];


//  Originally
//	NSString *urlString = @"https://api.openweathermap.org/data/2.5/weather?appid=6f2c843f65a34256d86a30d54be8d6a4&units=metric&q=London";
//	NSURL *listURL = [NSURL URLWithString:urlString];
//
//	__unused NSURLRequest *request = [NSURLRequest requestWithURL:listURL];
//
//	NSURLSession *session = [NSURLSession sharedSession];
//
//	NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//	                                          NSError *jsonError;
//
//	                                          id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
//
//	                                          NSLog(@"%@", jsonObj);
//					  }];
//
//	[dataTask resume];

}

- (void) _getSandBoxPath:(WeatherData *)weatherData {
	NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);

	NSString *cachePath = [pathArray firstObject];

	NSFileManager *fileManager = [NSFileManager defaultManager];


	// create directory
	NSString *dataPath = [cachePath stringByAppendingString:@"Data"];

	NSError *cacheError;

	[fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&cacheError];

	// create file
	NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
	NSData *listData = [@"ABC" dataUsingEncoding:NSUTF8StringEncoding];

	[fileManager createFileAtPath:listDataPath contents:listData attributes:nil];

	// query
	BOOL fileExist = [fileManager fileExistsAtPath:listDataPath];
    
    NSLog(@"weatherData: %b", fileExist);

	// detele
	//    if (fileExist) {
	//        [fileManager removeItemAtPath:listDataPath error:nil];
	//    }


	//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listDataPath];
	//
	//    [fileHandler seekToEndOfFile];
	//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
	//
	//    [fileHandler synchronizeFile];
	//    [fileHandler closeFile];


	// NSUserDefaults
	NSLog(@"weatherData: %@", weatherData);

	NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:weatherData requiringSecureCoding:NO error:nil];

	[[NSUserDefaults standardUserDefaults] setObject:encodedObject forKey:@"listData"];

	NSData *testListdata = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];

	NSLog(@"testListdata: %@", testListdata);

    NSError *unarchivingError = nil;
    WeatherData *unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[WeatherData class], [Main class], [Weather class], [NSArray class], [NSString class], nil] fromData:testListdata error:&unarchivingError];

	NSLog(@"unarchiveObj: %@", unarchiveObj);
}



@end
