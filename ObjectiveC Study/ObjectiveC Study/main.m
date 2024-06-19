//
//  main.m
//  ObjectiveC Study
//
//  Created by Harry Xiong on 2024/6/18.
//

#import <Foundation/Foundation.h>
#import "OCClass/OCClass.h"

void demoOCClass(void);


void demoOCClass(void)
{
    // 在oc中，想执行一些行为，就写上一个中括号[行为执行者 行为名称]
    
    // 定义了一个指针变量 Car1,Car1 将来指向的是 Car 类型的对象
    // [Car new] 会创建一个新对象，并且会返回对象本身（新对象地址 ）
    Car *car1 = [Car new];
    Car *car2 = [Car new];
    
    car2->wheels = 5;
    car2->speed = 300;
    
    // 给Car1所指向对象的wheels属性赋值
    car1->wheels = 4;
    car1->speed = 250;
    
    // 给Car1所指向对象发送一条run消息
    [car1 run];
    
    NSLog(@"车子有%d个轮子，时速位：%dkm/h", car1->wheels, car2->speed);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {

        demoOCClass();
        
        return 0;
    }
    return 0;
}
