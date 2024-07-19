//
//  KeyboardController.m
//  AppDemo
//

#import "KeyboardController.h"
#import "../Utils/KeyboardShortcutManager.h"
#import "Masonry/Masonry.h"

@interface KeyboardController ()

@property (nonatomic, strong, readwrite) UILabel *lableView;

@end

@implementation KeyboardController

- (instancetype)init {
	self = [super init];

	if (self) {
		self.tabBarItem.title = @"Keyboard View";
		self.view.backgroundColor = [UIColor whiteColor];
	}

	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.tabBarItem.title = @"Keyboard View";
	self.view.backgroundColor = [UIColor whiteColor];

	self.lableView = [[UILabel alloc] init];
	self.lableView.text = @"No Keyboard Pressed";
	[self.view addSubview:self.lableView];

	[self.lableView mas_makeConstraints:^(MASConstraintMaker *make) {
	         make.centerX.equalTo(self.view.mas_centerX);
	         make.centerY.equalTo(self.view.mas_centerY);
	         make.width.mas_equalTo(200);
	         make.height.mas_equalTo(100);
	 }];

	[self.view becomeFirstResponder];

	// register single keyboard shortcut
	[[KeyboardShortcutManager sharedManager] addPressedKeyCommandWithInput:UIKeyInputUpArrow action:@selector(handleUpArrow) target:self];
	[[KeyboardShortcutManager sharedManager] addPressedKeyCommandWithInput:UIKeyInputDownArrow action:@selector(handleDownArrow) target:self];
	[[KeyboardShortcutManager sharedManager] addPressedKeyCommandWithInput:@" " action:@selector(handleSpace) target:self];

	// register multiple keyboard shortcut
	[[KeyboardShortcutManager sharedManager] addUIKeyCommandWithInput:@"c" modifierFlags:0 action:@selector(handleCommandC) target:self];
}

- (BOOL)canBecomeFirstResponder {
	return YES;
}

// Handle key press events
- (void)pressesBegan:(NSSet<UIPress *> *)presses withEvent:(UIPressesEvent *)event {
	[super pressesBegan:presses withEvent:event];
	[[KeyboardShortcutManager sharedManager] handlePressedKey:presses withEvent:event];
}

// Handle key press events, cannot work on some keyborads which has default behavior, but it is useful in combination keyboard buttons
- (NSArray<UIKeyCommand *> *)keyCommands {
	return [[KeyboardShortcutManager sharedManager] keyCommands];
}


- (void)handleUpArrow {
	dispatch_async(dispatch_get_main_queue(), ^{
		self.lableView.text = @"Press UpArrow";
	});
}

- (void)handleDownArrow {
	dispatch_async(dispatch_get_main_queue(), ^{
		self.lableView.text = @"Press DownArrow";
	});
}

- (void)handleSpace {
	dispatch_async(dispatch_get_main_queue(), ^{
		self.lableView.text = @"Press Space";
	});

}

- (void)handleCommandC {
	dispatch_async(dispatch_get_main_queue(), ^{
		self.lableView.text = @"Press C";
	});

}

@end
