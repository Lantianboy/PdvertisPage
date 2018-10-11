//
//  ZCountdownLabel.m
//  PdvertisPage
//
//  Created by andacx on 2018/10/10.
//  Copyright © 2018年 andacx. All rights reserved.
//

#import "ZCountdownLabel.h"

@interface ZCountdownLabel ()


@end

@implementation ZCountdownLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame] ;
    if (self) {
        
        self.clipsToBounds = YES ;
        self.layer.cornerRadius = 16 ;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale ;
        self.userInteractionEnabled = YES ;
        self.backgroundColor = [UIColor clearColor] ;
        self.textAlignment = NSTextAlignmentCenter ;
        self.text = @"5秒后跳转" ;
        self.textColor = [UIColor blackColor] ;
        self.font = [UIFont systemFontOfSize:10] ;
        self.layer.borderWidth = 1 ;
        self.layer.borderColor = [UIColor blackColor].CGColor ;
        
        UITapGestureRecognizer * singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)] ;
        [self addGestureRecognizer:singleTap] ;
        
        _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES] ;
        
    }
    return self ;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)tap
{
    [self.countDownTimer invalidate] ;
    self.countDownTimer = nil ;
    if(self.blockNewJumpController){
        self.blockNewJumpController() ;
    }
}

- (void)countDown
{
    static int countDown = 5 ;
    
    countDown -- ;
    
    self.text = [NSString stringWithFormat:@"%d秒后跳转",countDown] ;
    
    if(countDown == 0){
        if(self.blockNewJumpController){
            [self.countDownTimer invalidate] ;
            self.countDownTimer = nil ;
            self.blockNewJumpController() ;
        }
    }
}


@end
