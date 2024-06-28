//
//  ViewController2.m
//  AppDemo
//

#import "../Views/DeleteCellView.h"
#import "../Views/NormalTableViewCell.h"
#import "TableListController.h"
#import "../Utils/ListLoader.h"

@interface TableListController () <UITableViewDataSource, UITableViewDelegate, NormalTableViewCellDelegate>

@property(nonatomic, strong, readwrite) UILabel *nameLabel;
@property(nonatomic, strong, readwrite) UILabel *temperatureLabel;

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


	UIView *headView = [[UIView alloc] init];
	headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 60);

	self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, self.view.frame.size.width / 2, 30)];
	self.temperatureLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2, 30, self.view.frame.size.width / 2, 30)];
	self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:20];
	self.temperatureLabel.textColor = [UIColor blackColor];

	[headView addSubview:self.nameLabel];
	[headView addSubview:self.temperatureLabel];

	tableView.tableHeaderView = headView;

	ListLoader *loader = [[ListLoader alloc] init];
	[loader loadData: ^(WeatherData *weatherData, NSError *error) {
	         dispatch_async(dispatch_get_main_queue(), ^{
					self.nameLabel.text = weatherData.name;
					self.temperatureLabel.text = [NSString stringWithFormat:@"%.1f°C",
					                              weatherData.main.temp];
				});
	 }];
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
