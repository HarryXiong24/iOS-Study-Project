//
//  DetailViewController.m
//  AppDemo
//
//  Created by Harry Xiong on 2024/7/7.
//

#import "DetailViewController.h"
#import "../Utils/Mediator.h"

@interface DetailViewController ()

@property (nonatomic, copy, readwrite) NSString *urlString;

@end

@implementation DetailViewController

+ (void)load {
    // url schema
    //    [Mediator registerScheme:@"detail://" processBlock:^(NSDictionary * _Nonnull params) {
    //        NSString *url = (NSString *)[params objectForKey:@"url"];
    //        UINavigationController *navigationController = (UINavigationController *)[params objectForKey:@"controller"];
    //        DetailViewController *controller = [[DetailViewController alloc] initWithUrlString:url];
    ////        controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    //        [navigationController pushViewController:controller animated:YES];
    //    }];
    
    // protocal class
    [Mediator registerProtol:@protocol(DetailViewControllerProtocol) class:[self class]];
}

- (instancetype)initWithUrlString:(NSString *)urlString {
    self = [super init];
    if (self) {
        self.urlString = urlString;
    }
    return self;
}

- (__kindof UIViewController *)detailViewControllerWithUrl:(NSString *)detailUrl{
    return [[[self class] alloc] initWithUrlString:detailUrl];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
