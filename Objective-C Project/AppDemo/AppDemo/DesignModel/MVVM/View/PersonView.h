//
//  PersonView.h
//  AppDemo
//

#import <UIKit/UIKit.h>
#import "PersonViewModel.h"

@interface PersonView : UIView

@property (nonatomic, strong) UILabel *nameLabel;

- (void)configureWithViewModel:(PersonViewModel *)viewModel;

@end
