//
//  PersonViewModel.h
//  AppDemo
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *fullName;

- (instancetype)initWithPerson:(Person *)person;

@end
