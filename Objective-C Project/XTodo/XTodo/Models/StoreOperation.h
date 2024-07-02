//
//  StoreOperation.h
//  XTodo
//
//  Created by Harry Xiong on 2024/7/1.
//

#import <Foundation/Foundation.h>
#import "TodoItem.h"

@interface StoreOperation : NSObject

- (NSMutableArray<TodoItem *> *)getTodoList;
- (void)savedTodoListWithTitle:(NSString *)title content:(NSString *)content date:(NSDate *)date;
- (void)resetTodoList;

@end
