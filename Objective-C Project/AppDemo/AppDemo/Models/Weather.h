//
//  Weather.h
//  AppDemo
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Main : NSObject <NSCoding>

@property (nonatomic) double temp;

+ (BOOL)supportsSecureCoding;
- (void)encodeWithCoder:(NSCoder *)coder;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface Weather : NSObject <NSCoding>

@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic) int id;

+ (BOOL)supportsSecureCoding;
- (void)encodeWithCoder:(NSCoder *)coder;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface WeatherData : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) Main *main;
@property (nonatomic, strong) NSArray<Weather *> *weather;

+ (BOOL)supportsSecureCoding;
- (void)encodeWithCoder:(NSCoder *)coder;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
