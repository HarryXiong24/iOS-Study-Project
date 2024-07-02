//
//  StoreOperation.m
//  XTodo
//

#import "StoreOperation.h"

@interface StoreOperation ()

@property (nonatomic, strong, readwrite) NSUserDefaults *defaults;
@property (nonatomic, strong, readwrite) NSData *savedData;

@end

@implementation StoreOperation

- (instancetype)init {
    self = [super init];

    if (self) {
        self.defaults = [NSUserDefaults standardUserDefaults];
    }

    return self;
}

- (NSMutableArray<TodoItem *> *)getTodoList {
    self.savedData = [self.defaults objectForKey:@"todoItems"];
    NSMutableArray<TodoItem *> *todoList = [NSMutableArray array];

    if (self.savedData) {
        NSError *error;
        NSSet *classes = [NSSet setWithObjects:[NSMutableArray class], [TodoItem class], [NSString class], [NSDate class], nil];
        todoList = (NSMutableArray<TodoItem *> *)[NSKeyedUnarchiver unarchivedObjectOfClasses:classes fromData:self.savedData error:&error];

        if (error) {
            NSLog(@"Failed to unarchive todo items: %@", error);
        }
    }

    //    for (TodoItem *item in todoList) {
    //        NSLog(@"No: %d, Name: %@, Content: %@, Date: %@", item.no, item.title, item.content, item.date);
    //    }

    return todoList;
}

- (void)savedTodoListWithTitle:(NSString *)title content:(NSString *)content date:(NSDate *)date {
    self.savedData = [self.defaults objectForKey:@"todoItems"];
    NSMutableArray<TodoItem *> *todoItems;

    if (self.savedData) {
        NSError *error;
        NSSet *classes = [NSSet setWithObjects:[NSMutableArray class], [TodoItem class], [NSString class], [NSDate class], nil];
        todoItems = (NSMutableArray<TodoItem *> *)[NSKeyedUnarchiver unarchivedObjectOfClasses:classes fromData:self.savedData error:&error];

        if (error) {
            NSLog(@"Failed to unarchive todo items: %@", error);
            todoItems = [NSMutableArray array];
        }
    } else {
        todoItems = [NSMutableArray array];
    }

    // Create a new TodoItem
    int newNo = (int)(todoItems.count + 1); // Generate a new 'no' based on the count
    TodoItem *newItem = [[TodoItem alloc] initWithNo:newNo title:title content:content date:date];

    // Add the new item to the array
    [todoItems addObject:newItem];

    // Serialize the updated array and save it back to NSUserDefaults
    NSError *error;
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:todoItems requiringSecureCoding:YES error:&error];

    if (!error) {
        [self.defaults setObject:data forKey:@"todoItems"];
        [self.defaults synchronize];
        self.savedData = data; // update savedData
        NSLog(@"Called Saved Data: %@", self.savedData);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ListUpdated" object:nil];
    } else {
        NSLog(@"Failed to archive todo items: %@", error);
    }
}

- (void)resetTodoList {
    self.savedData = [self.defaults objectForKey:@"todoItems"];
    [self.defaults removeObjectForKey:@"todoItems"];
    [self.defaults synchronize]; // Ensure changes are saved immediately
    self.savedData = nil;         // Update savedData to reflect the reset states
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ListUpdated" object:nil];
}

@end
