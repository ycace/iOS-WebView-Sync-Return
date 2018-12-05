//
//  UIWebViewController.m
//  webkitSyncReturn
//
//  Created by 严诚 on 2018/12/5.
//  Copyright © 2018 严诚. All rights reserved.
//

#import "UIWebViewController.h"
#import "YCWebVIew.h"
@interface UIWebViewController ()<YCPromptDelegate>
@property(strong, nonatomic)YCWebVIew *webview;
@end

@implementation UIWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.webview = [[YCWebVIew alloc] initWithFrame:self.view.bounds];
    self.webview.promptDelegate = self;
    [self.view addSubview:self.webview];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"test" ofType:@"html"]];
    [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
    /*
     UIWebView中一般我们会用这种方法去调用js方法
     [self.webview stringByEvaluatingJavaScriptFromString:@"callback"];
     */
    
}
- (NSString *)webView:(UIWebView *)sender runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)text initiatedByFrame:(CGRect)frame{
    //直接ruturn，在js层面实现直接返回的效果
    return prompt;
}




@end
