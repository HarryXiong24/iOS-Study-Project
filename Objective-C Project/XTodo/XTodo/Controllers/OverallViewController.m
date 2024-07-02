//
//  OverallViewController.m
//  XTodo
//

#import <Masonry/Masonry.h>
#import "OverallViewController.h"
#import "CreateTodoViewController.h"
#import "../Models/TodoItem.h"
#import "../Models/StoreOperation.h"

@interface OverallViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic, readwrite) NSMutableArray<TodoItem *> *todoList;
@property (strong, nonatomic, readwrite) StoreOperation *dataOperation;

@end

@implementation OverallViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // add observer
    self.dataOperation = [[StoreOperation alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"ListUpdated" object:nil];

	// title and style
	self.navigationItem.title = @"X Todo";
	NSDictionary *titleAttributes = @{
		NSForegroundColorAttributeName: [UIColor blackColor],
		NSFontAttributeName: [UIFont boldSystemFontOfSize:24]
	};
	self.navigationController.navigationBar.titleTextAttributes = titleAttributes;

	// right button
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage systemImageNamed:@"plus"]
	                                style:UIBarButtonItemStylePlain
	                                target:self
	                                action:@selector(rightButtonTapped:)];
	self.navigationItem.rightBarButtonItem = rightButton;

	// todo list
	self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
	[self.view addSubview:self.tableView];

	self.tableView.dataSource = self;
	self.tableView.delegate = self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.todoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
	}

    TodoItem *item = [self.todoList objectAtIndex:indexPath.row];
	cell.textLabel.text = item.title;

	return cell;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
	// create delete option
	UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"Delete" handler:^(UIContextualAction *action, UIView *sourceView, void (^completionHandler)(BOOL)) {
	                                            [self.todoList removeObjectAtIndex:indexPath.row];
	                                            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
	                                            completionHandler(YES);
					    }];

	// create detail option
	UIContextualAction *editAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"Edit" handler:^(UIContextualAction *action, UIView *sourceView, void (^completionHandler)(BOOL)) {
	                                          // handle
	                                          UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"More Action" message:[NSString stringWithFormat:@"More action for %@", self.todoList[indexPath.row]] preferredStyle:UIAlertControllerStyleAlert];
	                                          [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
	                                          [self presentViewController:alert animated:YES completion:nil];
	                                          completionHandler(YES);
					  }];
	editAction.backgroundColor = [UIColor blueColor];

	// return
	UISwipeActionsConfiguration *configuration = [UISwipeActionsConfiguration configurationWithActions:@[deleteAction, editAction]];
	return configuration;
}

- (void) rightButtonTapped:(id)sender {
	CreateTodoViewController *createTodoVC = [[CreateTodoViewController alloc] init];

	// if I use NavigationBar
	//	[self.navigationController pushViewController:createTodoVC animated:YES];

	// I use the normal way
    //	createTodoVC.modalPresentationStyle = UIModalPresentationFormSheet;
    //	[self presentViewController:createTodoVC animated:YES completion:nil];
    
    createTodoVC.modalPresentationStyle = UIModalPresentationFormSheet;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:createTodoVC];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}

- (void) reloadData {
    self.todoList = [self.dataOperation getTodoList];
    [self.tableView reloadData];
}

@end
