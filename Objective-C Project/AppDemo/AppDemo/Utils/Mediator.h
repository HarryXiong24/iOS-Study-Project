//
//  Mediator.h
//  AppDemo
//
//  Created by Harry Xiong on 2024/7/7.
//

#import <UIKit/UIKit.h>

@protocol DetailViewControllerProtocol <NSObject>

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

@end


@interface Mediator : NSObject

// target - action
+ (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl;

// url schema
typedef void(^MediatorProcessBlock)(NSDictionary *params);
+ (void)registerScheme:(NSString *)scheme processBlock:(MediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString *)url params:(NSDictionary *)params;

// protol class
+ (void)registerProtol:(Protocol *)proto class:(Class)cls;
+ (Class)classForProtocol:(Protocol *)proto;

@end
