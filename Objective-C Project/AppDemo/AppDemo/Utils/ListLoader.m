//
//  ListLoader.m
//  AppDemo
//

#import "ListLoader.h"
#import <AFNetworking.h>
#import "../Models/Weather.h"

@implementation ListLoader

- (void)loadData:(void (^)(WeatherData *weatherData, NSError *error))completion {


    [[AFHTTPSessionManager manager] GET:@"https://api.openweathermap.org/data/2.5/weather?appid=6f2c843f65a34256d86a30d54be8d6a4&units=metric&q=London" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        
        WeatherData *weatherData = [[WeatherData alloc] initWithDictionary:responseObject];
        
        NSLog(@"Name: %@", weatherData.name);
        NSLog(@"Temperature: %f", weatherData.main.temp);
        
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

@end
