//
//  PersonView.m
//  AppDemo
//

#import "PersonView.h"

@implementation PersonView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _nameLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLabel];
    }
    return self;
}

- (void)configureWithViewModel:(PersonViewModel *)viewModel {
    self.nameLabel.text = viewModel.fullName;
}

@end
