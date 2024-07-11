//
//  SearchBar.m
//  AppDemo
//

#import "SearchBar.h"
#import <Masonry/Masonry.h>

@interface SearchBar () <UITextFieldDelegate>

@end

@implementation SearchBar

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.leftView = [[UIImageView alloc] initWithImage:[UIImage systemImageNamed:@"magnifyingglass"]];
        self.leftViewMode = UITextFieldViewModeUnlessEditing;
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.placeholder = @"Test";
    }
    return self;
}

#pragma mark -


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    //
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // 常用业务逻辑 - 字数判断 可以在此函数中实现
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self resignFirstResponder];
    return YES;
}

@end
