//
//  ViewController.m
//  XTodo
//

#import "RootViewController.h"
#import "OverallViewController.h"
#import "View/NavigateViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.

	OverallViewController *overallController = [[OverallViewController alloc] init];
	NavigateViewController *overallNavController = [[NavigateViewController alloc] initWithRootViewController:overallController];

	self.tabBar.backgroundColor = [UIColor lightGrayColor];

	UIFont *font = [UIFont systemFontOfSize: 16];
	NSDictionary *attributes = @{NSFontAttributeName: font};

	[[UITabBarItem appearance] setTitleTextAttributes:attributes forState:UIControlStateNormal];
	[[UITabBarItem appearance] setTitleTextAttributes:attributes forState:UIControlStateSelected];

	[self setViewControllers:@[overallNavController]];
}

@end
