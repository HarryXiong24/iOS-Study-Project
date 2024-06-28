//
//  Weather.h
//  AppDemo
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Main : NSObject

@property (nonatomic) double temp;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface Weather : NSObject

@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic) int id;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface WeatherData : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Main *main;
@property (nonatomic, strong) NSArray<Weather *> *weather;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
