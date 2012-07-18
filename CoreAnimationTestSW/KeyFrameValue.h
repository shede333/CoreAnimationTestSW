//
//  KeyFrameValue.h
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-6-26.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyFrameValue : UIViewController

@property (retain, nonatomic) CALayer *myLayer;


- (IBAction)actionContents:(id)sender;
- (IBAction)actionTransform:(id)sender;

- (IBAction)actionTransaction:(id)sender;
- (IBAction)actionTest:(id)sender;

@end
