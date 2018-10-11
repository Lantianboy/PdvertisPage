//
//  ZJumpViewController.h
//  PdvertisPage
//
//  Created by andacx on 2018/10/11.
//  Copyright © 2018年 andacx. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^blockJumpMainViewController)();

@interface ZJumpViewController : UIViewController

@property (copy, nonatomic) blockJumpMainViewController blockJumpViewController ;
@end
