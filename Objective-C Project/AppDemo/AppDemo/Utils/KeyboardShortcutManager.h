//
//  KeyboardShortcutManager.h
//  AppDemo
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KeyboardShortcutManager : NSObject

+ (instancetype)sharedManager;

- (BOOL)addPressedKeyCommandWithInput:(NSString *)input action:(SEL)action target:(id)target;
- (BOOL)removePressedKeyCommandWithInput:(NSString *)input;
- (void)handlePressedKey:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event;

- (BOOL)addUIKeyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)flags action:(SEL)action target:(id)target;
- (BOOL)removeUIKeyCommandWithInput:(NSString *)input modifierFlags:(UIKeyModifierFlags)flags;
- (NSArray<UIKeyCommand *> *)keyCommands;

@end

