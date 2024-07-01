//
//  OverallViewController.m
//  XTodo
//

#import <Masonry/Masonry.h>
#import "OverallViewController.h"

@interface OverallViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *items;

@end

@implementation OverallViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Overall" image:[UIImage systemImageNamed:@"list.star"] selectedImage:[UIImage systemImageNamed:@"list.star.fill"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"X Todo";
    
    self.items = [NSMutableArray arrayWithArray:@[@"Item 1", @"Item 2", @"Item 3"]];


    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];


    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", @(indexPath.row)];

    return cell;
}

//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.items removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        
//    }
//}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建删除操作
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"Delete" handler:^(UIContextualAction *action, UIView *sourceView, void (^completionHandler)(BOOL)) {
        [self.items removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        completionHandler(YES);
    }];
    
    // 创建更多操作
    UIContextualAction *moreAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"More" handler:^(UIContextualAction *action, UIView *sourceView, void (^completionHandler)(BOOL)) {
        // 处理更多操作
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"More Action" message:[NSString stringWithFormat:@"More action for %@", self.items[indexPath.row]] preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
        completionHandler(YES);
    }];
    moreAction.backgroundColor = [UIColor lightGrayColor]; // 设置更多操作的背景颜色

    // 返回包含所有操作的配置
    UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction, moreAction]];
    return configuration;
}



@end
