//
//  ZPageView.h
//  PdvertisPage
//
//  Created by andacx on 2018/10/10.
//  Copyright © 2018年 andacx. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^blockAdvertisIng)();

@interface ZPageView : UIView

@property (nonatomic, copy) NSString * pageUrlString ;
@property (nonatomic, copy) blockAdvertisIng blockAdvertis ;

@end
