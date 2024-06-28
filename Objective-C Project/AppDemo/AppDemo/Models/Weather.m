//
//  Weather.m
//  AppDemo
//

#import "Weather.h"

@implementation Main

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _temp = [dictionary[@"temp"] doubleValue];
    }
    return self;
}

@end

@implementation Weather

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _descriptionText = dictionary[@"description"];
        _id = [dictionary[@"id"] intValue];
    }
    return self;
}

@end


@implementation WeatherData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = dictionary[@"name"];
        _main = [[Main alloc] initWithDictionary:dictionary[@"main"]];
        
        NSMutableArray<Weather *> *weatherArray = [NSMutableArray array];
        for (NSDictionary *weatherDict in dictionary[@"weather"]) {
            Weather *weather = [[Weather alloc] initWithDictionary:weatherDict];
            [weatherArray addObject:weather];
        }
        _weather = [weatherArray copy];
    }
    return self;
}

@end
