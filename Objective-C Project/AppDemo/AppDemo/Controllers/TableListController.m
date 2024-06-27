//
//  ViewController2.m
//  AppDemo
//

#import "../Components/DeleteCellView.h"
#import "../Components/NormalTableViewCell.h"
#import "TableListController.h"

@interface TableListController () <UITableViewDataSource, UITableViewDelegate, NormalTableViewCellDelegate>

@end

@implementation TableListController

- (instancetype)init {
    self = [super init];

    if (self) {
        self.tabBarItem.title = @"TableList";
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];

    [self.view addSubview:tableView];

    tableView.dataSource = self;
    tableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

    if (!cell) {
        cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }

    [cell layoutTableViewCell];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIViewController *controller = [[UIViewController alloc] init];

    controller.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];

    [self.navigationController pushViewController:controller animated:YES];
}

- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)button {
    DeleteCellView *deleteCellView = [[DeleteCellView alloc] initWithFrame:self.view.bounds];
    CGRect rect = [tableViewCell convertRect:button.frame toView:nil];

    [deleteCellView showDeleteViewFromPoint:rect.origin
                                 clickBlock:^{
        NSLog(@"Delete!");
    }];
}

@end
