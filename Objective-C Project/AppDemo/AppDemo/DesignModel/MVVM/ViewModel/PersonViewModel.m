//
//  PersonViewModel.m
//  AppDemo
//

#import "PersonViewModel.h"

@interface PersonViewModel ()

@property (nonatomic, strong) Person *person;

@end

@implementation PersonViewModel

- (instancetype)initWithPerson:(Person *)person {
    self = [super init];
    if (self) {
        _person = person;
        _fullName = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
    }
    return self;
}

@end
