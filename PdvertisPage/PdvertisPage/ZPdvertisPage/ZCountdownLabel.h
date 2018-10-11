//
//  ZCountdownLabel.h
//  PdvertisPage
//
//  Created by andacx on 2018/10/10.
//  Copyright © 2018年 andacx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^blockSelectJump)();

@interface ZCountdownLabel : UILabel

@property (nonatomic, copy) blockSelectJump blockNewJumpController ;

@property (nonatomic, strong) NSTimer * countDownTimer ;

@end
