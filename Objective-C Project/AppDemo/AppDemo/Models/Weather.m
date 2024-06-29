//
//  Weather.m
//  AppDemo
//

#import "Weather.h"

@implementation Main


+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeDouble:self.temp forKey:@"temp"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _temp = [coder decodeDoubleForKey:@"temp"];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _temp = [dictionary[@"temp"] doubleValue];
    }
    return self;
}

@end

@implementation Weather


+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.descriptionText forKey:@"description"];
    [coder encodeInt:self.id forKey:@"id"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _descriptionText = [coder decodeObjectOfClass:[NSString class] forKey:@"description"];
        _id = [coder decodeIntForKey:@"id"];
    }
    return self;
}

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

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.main forKey:@"main"];
    [coder encodeObject:self.weather forKey:@"weather"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _name = [coder decodeObjectOfClass:[NSString class] forKey:@"name"];
        _main = [coder decodeObjectOfClass:[Main class] forKey:@"main"];
        _weather = [coder decodeObjectOfClasses:[NSSet setWithObjects:[NSArray class], [Weather class], nil] forKey:@"weather"];
    }
    return self;
}

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
