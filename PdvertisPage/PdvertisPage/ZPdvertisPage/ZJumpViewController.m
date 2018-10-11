//
//  ZJumpViewController.m
//  PdvertisPage
//
//  Created by andacx on 2018/10/11.
//  Copyright © 2018年 andacx. All rights reserved.
//

#import "ZJumpViewController.h"
#import "ZPageView.h"
#import "ZCountdownLabel.h"
#import "AdvertisViewController.h"
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface ZJumpViewController ()

@property (nonatomic, strong) ZPageView * pageView ;
@end

@implementation ZJumpViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated] ;
    self.navigationController.navigationBarHidden = YES ;
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated] ;
    self.navigationController.navigationBarHidden = NO ;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self pageViewInit] ;
}

- (void)pageViewInit {
    WS(weakSelf);
    
    
    ZCountdownLabel *countdownLabel = [[ZCountdownLabel alloc] initWithFrame:CGRectMake(KScreenWidth - 80,  44, 60, 30)];
    countdownLabel.blockNewJumpController = ^{
        [self removerSCPageView];
    };
    
    
    self.pageView = [[ZPageView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    // _pageView.pageURLString = @""; 这个里面写url的连接
    self.pageView.blockAdvertis = ^{
        NSLog(@"广告页被点击。。。跳转下载的地址。或者产品的官网都可以的！！！");
        
        [countdownLabel.countDownTimer invalidate] ;
        countdownLabel.countDownTimer = nil ;
        AdvertisViewController *demoVC = [[AdvertisViewController alloc] init];
        
        //demoVC.touchUrlString = @"" ;//广告页的url地址
        
        [weakSelf.navigationController pushViewController:demoVC animated:NO];
    };
    [self.view addSubview:self.pageView];
    
    [self.pageView addSubview:countdownLabel];
}

- (void)removerSCPageView {
//    WS(weakSelf);
    [UIView animateWithDuration:0.5 animations:^{
        self.pageView.alpha = 0.5;
    } completion:^(BOOL finished) {
        if (self.blockJumpViewController) {
            self.blockJumpViewController();
        }
    }];
}


@end
