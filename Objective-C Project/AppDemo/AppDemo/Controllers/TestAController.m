//
//  ViewController.m
//  AppDemo
//

#import "TestAController.h"
#import <Masonry/Masonry.h>

@interface TestAController ()

@property (readwrite) UILabel *label;
@property (readwrite) UIAlertController *alertController;

@end

@implementation TestAController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // backgrounds
    UIView *backgroudDiv = [[UIView alloc] init];
    backgroudDiv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:backgroudDiv];
    
    [backgroudDiv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    // view1
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [backgroudDiv addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroudDiv).offset(10);
        make.left.equalTo(backgroudDiv).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];

    // view2
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [backgroudDiv addSubview:view2];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left);
        make.bottom.equalTo(backgroudDiv.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];

    // view3
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor blueColor];
    [backgroudDiv addSubview:view3];
    
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backgroudDiv.mas_top).offset(10);
        make.right.equalTo(backgroudDiv.mas_right).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];

    // in-box label
    UILabel *titleInView3 = [[UILabel alloc] init];
    titleInView3.text = @"Long press me to show hidden text!";
    titleInView3.numberOfLines = 5;
    titleInView3.textColor = [UIColor whiteColor];
    [titleInView3 sizeToFit];
    [view3 addSubview:titleInView3];
    
    [titleInView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view3);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];

    // hidden label
    self.label = [[UILabel alloc] init];
    self.label.text = @"Hello World";
    [self.label sizeToFit];
    [self.label setHidden:YES];
    [self.view addSubview:self.label];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(backgroudDiv.mas_top).offset(-30);
    }];


    // view4
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor yellowColor];
    [backgroudDiv addSubview:view4];
    
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(backgroudDiv.mas_right).offset(-10);
        make.bottom.equalTo(backgroudDiv.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    

    self.alertController = [UIAlertController alertControllerWithTitle:@"My Alert"
                                                               message:@"This is an alert."
                                                        preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction *action) {}];

    [self.alertController addAction:defaultAction];


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
