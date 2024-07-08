//
//  Mediator.m
//  AppDemo
//
//  Created by Harry Xiong on 2024/7/7.
//

#import <Foundation/Foundation.h>
#import "Mediator.h"

@implementation Mediator

// target - action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl {
    Class detailCls = NSClassFromString(@"DetailViewController");

    # pragma clang diagnostic push
    # pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    UIViewController *controller = [[detailCls alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:detailUrl];
    # pragma clang diagnostic pop
    return controller;

//    UIViewController *controller = [[UIViewController alloc] init];
//    return controller;
}

// url schema
+ (NSMutableDictionary *)mediatorCache{
    static NSMutableDictionary *cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}

+ (void)registerScheme:(NSString *)scheme processBlock:(MediatorProcessBlock)processBlock{
    if (scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}

+ (void)openUrl:(NSString *)url params:(NSDictionary *)params{
    MediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if (block) {
        block(params);
    }
}

// protocal class
+ (void)registerProtol:(Protocol *)proto class:(Class)cls{
    if (proto && cls) {
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}

+ (Class)classForProtocol:(Protocol *)proto{
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];
}

@end
