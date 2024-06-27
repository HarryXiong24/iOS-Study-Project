//
//  ViewController.m
//  AppDemo
//

#import "TestAController.h"

@interface TestAController ()

@property (readwrite) UILabel *label;
@property (readwrite) UIAlertController *alertController;

@end

@implementation TestAController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:view];

    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    view2.frame = CGRectMake(150, 150, 100, 100);
    [self.view addSubview:view2];

    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor blueColor];
    view3.frame = CGRectMake(300, 300, 100, 100);
    [self.view addSubview:view3];

    UILabel *titleInView3 = [[UILabel alloc] init];
    titleInView3.text = @"Long press me to show hidden text!";
    titleInView3.frame = CGRectMake(0, 0, 100, 100);
    titleInView3.numberOfLines = 5;
    titleInView3.textColor = [UIColor whiteColor];
    [titleInView3 sizeToFit];
    [view3 addSubview:titleInView3];

    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(100, 300, 60, 30);
    self.label.text = @"Hello World";
    [self.label sizeToFit];
    [self.label setHidden:YES];
    [self.view addSubview:self.label];


    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor yellowColor];
    view4.frame = CGRectMake(100, 400, 100, 100);
    [self.view addSubview:view4];

    self.alertController = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                               message:@"This is an alert."
                                                        preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {}];

    [self.alertController addAction:defaultAction];


    UITabBar *tabBar = [[UITabBar alloc] init];
    [self.view addSubview:tabBar];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [view2 addGestureRecognizer:tapGesture];

    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressEvent)];
    [view3 addGestureRecognizer:longPressGesture];

    UITapGestureRecognizer *tapGesture4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(alert)];
    [view4 addGestureRecognizer:tapGesture4];
}

- (void)alert {
    [self presentViewController:self.alertController animated:YES completion:nil];
}

- (void)pushController {
    UIViewController *viewController = [[UIViewController alloc] init];

    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"Back";

//    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:<#(nullable NSString *)#> menu:<#(nullable UIMenu *)#>]

    [self.navigationController pushViewController:(UIViewController *)viewController animated:YES];
}

- (void)longPressEvent {
    [self.label setHidden:NO];
}

@end
