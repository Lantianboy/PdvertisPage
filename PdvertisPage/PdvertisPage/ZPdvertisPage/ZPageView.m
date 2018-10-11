//
//  ZPageView.m
//  PdvertisPage
//
//  Created by andacx on 2018/10/10.
//  Copyright © 2018年 andacx. All rights reserved.
//

#import "ZPageView.h"
#import "UIImageView+WebCache.h"
@interface ZPageView ()

@property (nonatomic, strong) UIImageView * advertisImage ;

@end

@implementation ZPageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame] ;
    if (self) {
        self.userInteractionEnabled = YES ;
        
        self.advertisImage = [[UIImageView alloc] initWithFrame:self.bounds] ;
        self.advertisImage.userInteractionEnabled = YES ;
        [self addSubview:self.advertisImage] ;
        
        UITapGestureRecognizer * Tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)] ;
        [self.advertisImage addGestureRecognizer:Tap] ;
    }
    return self ;
}

- (void)setPageUrlString:(NSString *)pageUrlString
{
    _pageUrlString = pageUrlString ;
}

- (void)layoutSubviews
{
    [super layoutSubviews] ;
    [_advertisImage sd_setImageWithURL:[NSURL URLWithString:_pageUrlString] placeholderImage:[UIImage imageNamed:@"image.jpg"]];  //加载网络图片
    
}

- (void)handleSingleTap:(UITapGestureRecognizer *)tap
{
    if (self.blockAdvertis) {
        self.blockAdvertis() ;
    }
}


@end
