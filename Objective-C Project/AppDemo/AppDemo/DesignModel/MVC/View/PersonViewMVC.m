//
//  PersonViewMVC.m
//  AppDemo
//

#import "PersonViewMVC.h"

@implementation PersonViewMVC

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _nameLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLabel];
    }
    return self;
}

- (void)setName:(NSString *)name {
    self.nameLabel.text = name;
}
@end
