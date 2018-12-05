//
//  ViewController.m
//  webkitSyncReturn
//
//  Created by 严诚 on 2018/12/5.
//  Copyright © 2018 严诚. All rights reserved.
//

#import "ViewController.h"
#import "UIWebViewController.h"
#import "WKWebViewController.h"
@interface ViewController ()
@property (strong, nonatomic)UIButton *wkButton;
@property (strong, nonatomic)UIButton *uiwebButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.wkButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.wkButton setTitle:@"WKWebView" forState:UIControlStateNormal];
    [self.wkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.wkButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.wkButton];
    self.wkButton.frame = CGRectMake(100, 100, 200, 30);
    
    self.uiwebButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.uiwebButton setTitle:@"UIWebView" forState:UIControlStateNormal];
    [self.uiwebButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.uiwebButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.uiwebButton];
    self.uiwebButton.frame = CGRectMake(100, 150, 200, 30);
}

- (void)buttonAction:(UIButton *)btn{
    if (btn == self.wkButton) {
        NSLog(@"1");
        WKWebViewController *wkWebVC = [[WKWebViewController alloc] init];
        [self.navigationController pushViewController:wkWebVC animated:YES];
    }else{
        NSLog(@"2");
        UIWebViewController *uiWebVC = [[UIWebViewController alloc] init];
        [self.navigationController pushViewController:uiWebVC animated:YES];
    }
}

@end
