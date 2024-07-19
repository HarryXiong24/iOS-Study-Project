//
//  KeyboardShortcutManager.m
//  AppDemo
//

#import "KeyboardShortcutManager.h"

@interface KeyboardShortcutManager ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSDictionary *> *pressedKeyMap;
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSDictionary *> *uiKeyCommandMap;

@end

@implementation KeyboardShortcutManager

+ (instancetype)sharedManager {
    static KeyboardShortcutManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[KeyboardShortcutManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pressedKeyMap = [NSMutableDictionary dictionary];
        self.uiKeyCommandMap = [NSMutableDictionary dictionary];
    }
    return self;
}

// Simple key commands
- (BOOL)addPressedKeyCommandWithInput:(NSString *)input action:(SEL)action target:(id)target {
    if (input.length == 0 || !action || !target || ![target respondsToSelector:action]) {
        NSLog(@"Invalid key command, action, or target.");
        return NO;
    }
    self.pressedKeyMap[input] = @{@"action": NSStringFromSelector(action), @"target": target};
    return YES;
}

- (BOOL)removePressedKeyCommandWithInput:(NSString *)input {
    if (input.length == 0 || !self.pressedKeyMap[input]) {
        NSLog(@"Key command does not exist.");
        return NO;
    }
    [self.pressedKeyMap removeObjectForKey:input];
    return YES;
}

- (void)handlePressedKey:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
    for (UIPress *press in presses) {
        if (press.key == nil) {
            continue;
        }

        NSString *keyInput = press.key.charactersIgnoringModifiers;
        NSDictionary *commandInfo = self.pressedKeyMap[keyInput];

        if (commandInfo) {
            SEL action = NSSelectorFromString(commandInfo[@"action"]);
            id target = commandInfo[@"target"];
            if ([target respondsToSelector:action]) {
                [target performSelector:action withObject:nil];
            }
        }
    }
}

// Combination key commands
- (BOOL)addUIKeyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)flags action:(SEL)action target:(id)target {
    if (input.length == 0 || !action || !target || ![target respondsToSelector:action]) {
        NSLog(@"Invalid UIKeyCommand, action, or target.");
        return NO;
    }
    NSString *key = [NSString stringWithFormat:@"%@-%lu", input, (unsigned long)flags];
    self.uiKeyCommandMap[key] = @{@"action": NSStringFromSelector(action), @"target": target};
    return YES;
}

- (BOOL)removeUIKeyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)flags {
    NSString *key = [NSString stringWithFormat:@"%@-%lu", input, (unsigned long)flags];
    if (input.length == 0 || !self.uiKeyCommandMap[key]) {
        NSLog(@"UIKeyCommand does not exist.");
        return NO;
    }
    [self.uiKeyCommandMap removeObjectForKey:key];
    return YES;
}

- (NSArray<UIKeyCommand *> *)keyCommands {
    NSMutableArray<UIKeyCommand *> *commands = [NSMutableArray array];
    [self.uiKeyCommandMap enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSDictionary *commandInfo, BOOL *stop) {
        NSArray *components = [key componentsSeparatedByString:@"-"];
        NSString *input = components[0];
        UIKeyModifierFlags flags = (UIKeyModifierFlags)[components[1] integerValue];
        SEL action = NSSelectorFromString(commandInfo[@"action"]);
        [commands addObject:[UIKeyCommand keyCommandWithInput:input modifierFlags:flags action:action]];
    }];
    return commands;
}

@end

