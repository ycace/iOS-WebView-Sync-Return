//
//  WKWebViewController.m
//  webkitSyncReturn
//
//  Created by 严诚 on 2018/12/5.
//  Copyright © 2018 严诚. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>

@interface WKWebViewController ()<WKUIDelegate>
@property(strong, nonatomic)WKWebView *webview;
@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    self.webview = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:config];
    [self.view addSubview:self.webview];
    self.webview.UIDelegate = self;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"]];
    [self.webview loadFileURL:url allowingReadAccessToURL:[[NSBundle mainBundle]bundleURL]];
    /*
     WKWebView中一般我们会用这种方法去调用js方法
     [self.webview evaluateJavaScript:@"callback" completionHandler:^(id _Nullable, NSError * _Nullable error) {
     
     }]
     */
}

- (void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(nullable NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable result))completionHandler{
    //通过completionHandler将返回值传回js，在js层面实现直接返回的效果
    completionHandler(prompt);
}

- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler {
    // js里面的alert实现，如果不实现，WKWebView中的alert函数无效
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"好" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alertController animated:YES completion:nil];
    completionHandler();
}





@end
