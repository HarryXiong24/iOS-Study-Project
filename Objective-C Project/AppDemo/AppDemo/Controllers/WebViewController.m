//
//  ViewController5.m
//  AppDemo
//

#import <WebKit/WebKit.h>
#import "WebViewController.h"

@interface WebViewController ()

@property (nonatomic, strong, readwrite) WKWebView *webView;
@property (nonatomic, strong, readwrite) UIProgressView *progressView;

@end

@implementation WebViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        self.tabBarItem.title = @"Web View";
        self.view.backgroundColor = [UIColor whiteColor];

        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height)];

        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.google.com/"]]];

        [self.view addSubview:self.webView];

        [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];

        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];

        [self.view addSubview:self.progressView];
    }

    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey, id> *)change context:(void *)context {
    self.progressView.progress = self.webView.estimatedProgress;
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
