//
//  ViewControllerMVC.m
//  AppDemo
//

#import "ViewControllerMVC.h"
#import "Person.h"
#import "PersonViewMVC.h"

@interface ViewControllerMVC ()

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) PersonViewMVC *personView;

@end

@implementation ViewControllerMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [[Person alloc] initWithFirstName:@"John" lastName:@"Doe"];
    
    self.personView = [[PersonViewMVC alloc] initWithFrame:self.view.bounds];
    [self.personView setName:[NSString stringWithFormat:@"%@ %@", self.person.firstName, self.person.lastName]];
    
    [self.view addSubview:self.personView];
}

@end
