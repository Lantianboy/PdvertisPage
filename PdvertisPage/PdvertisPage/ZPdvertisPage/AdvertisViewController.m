//
//  AdvertisViewController.m
//  PdvertisPage
//
//  Created by andacx on 2018/10/11.
//  Copyright © 2018年 andacx. All rights reserved.
//

#import "AdvertisViewController.h"
#import "ViewController.h"
@interface AdvertisViewController ()<UIWebViewDelegate>

@end

@implementation AdvertisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"广告页" ;
    UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)] ;
    NSURL * url = [NSURL URLWithString:_touchUrlString ? _touchUrlString : @"https://www.baidu.com"] ;
    webView.delegate = self ;
    [webView loadRequest:[NSURLRequest requestWithURL:url]] ;
    
    [self.view addSubview:webView] ;

    self.navigationItem.hidesBackButton = YES;

    UIBarButtonItem *leftBarItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.leftBarButtonItem = leftBarItem;

}

- (void)onClickedOKbtn {
    
    UIWindow *window = [UIApplication sharedApplication].windows[1];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    window.rootViewController = nav;
    
}

- (void)webView:(UIWebView *)webView  didFailLoadWithError:(NSError *)error{
    
    NSLog(@"我报错了");

}

@end
