//
//  CreateTodoControllerViewController.m
//  XTodo
//

#import "CreateTodoViewController.h"
#import <Masonry/Masonry.h>
#import "../Models/TodoItem.h"
#import "../Models/StoreOperation.h"


@interface CreateTodoViewController ()

@property (nonatomic, strong) UITextField *titleTextField;
@property (nonatomic, strong) UITextField *contentTextField;
@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) StoreOperation *operation;

@end

@implementation CreateTodoViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view.

	self.view.backgroundColor = [UIColor whiteColor];
	self.navigationItem.title = @"Add New";

	// left button
	UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelCreate)];
	self.navigationItem.leftBarButtonItem = leftButton;

	// right button
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneCreate)];
	self.navigationItem.rightBarButtonItem = rightButton;


	// Title input
	self.titleTextField = [[UITextField alloc] init];
	self.titleTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.titleTextField.placeholder = @"Title";
	[self.view addSubview: self.titleTextField];

	[self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
	         make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(10);
	         make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).offset(20);
	         make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).offset(-20);
	 }];

	// Description input
	self.contentTextField = [[UITextField alloc] init];
	self.contentTextField.borderStyle = UITextBorderStyleRoundedRect;
	self.contentTextField.placeholder = @"Content";
	[self.view addSubview:self.contentTextField];

	[self.contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
	         make.top.equalTo(self.titleTextField.mas_bottom).offset(10);
	         make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).offset(20);
	         make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight).offset(-20);
	         make.height.mas_equalTo(100);
	 }];


	// Time input
	self.datePicker = [[UIDatePicker alloc] init];
	self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
	[self.view addSubview:self.datePicker];

	[self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
	         make.top.equalTo(self.contentTextField.mas_bottom).offset(10);
	         make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft).offset(20);
	 }];
    
    // delegate
    self.operation = [[StoreOperation alloc] init];

}

- (void) cancelCreate {

	// if I use NavigationBar
	//	[self.navigationController popViewControllerAnimated:YES];

	// normal way
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void) doneCreate {
	NSLog(@"Done button tapped!");

	NSString *title = self.titleTextField.text;
	NSString *content = self.contentTextField.text;
	NSDate *date = self.datePicker.date;

//	NSLog(@"Title: %@", title);
//	NSLog(@"Content: %@", content);
//	NSLog(@"Date: %@", date);

	// Save date to TodoItem objects
    [self.operation savedTodoListWithTitle:title content:content date:date];
	
	// if I use NavigationBar
	//	[self.navigationController popViewControllerAnimated:YES];

	// normal way
	[self dismissViewControllerAnimated: YES completion: nil];
}

@end
