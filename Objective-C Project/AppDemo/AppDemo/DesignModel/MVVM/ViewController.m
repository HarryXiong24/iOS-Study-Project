//
//  ViewController.m
//  AppDemo
//

#import "ViewController.h"
#import "Person.h"
#import "PersonViewModel.h"
#import "PersonView.h"

@interface ViewController ()

@property (nonatomic, strong) PersonView *personView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] initWithFirstName:@"John" lastName:@"Doe"];
    PersonViewModel *viewModel = [[PersonViewModel alloc] initWithPerson:person];
    
    self.personView = [[PersonView alloc] initWithFrame:self.view.bounds];
    [self.personView configureWithViewModel:viewModel];
    
    [self.view addSubview:self.personView];
}

@end
