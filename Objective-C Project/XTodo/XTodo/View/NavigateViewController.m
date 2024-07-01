//
//  NavigateViewController.m
//  XTodo
//

#import "NavigateViewController.h"

@interface NavigateViewController ()

@end

@implementation NavigateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    NSDictionary *titleAttributes = @{
        NSForegroundColorAttributeName: [UIColor blackColor],
        NSFontAttributeName: [UIFont boldSystemFontOfSize:24]
    };
    
    self.navigationBar.titleTextAttributes = titleAttributes;
    
//    self.navigationBar.backgroundColor = [UIColor colorWithRed:93.0/255.0 green:93.0/255.0 blue:93.0/255.0 alpha:1.0];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
