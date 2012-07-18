//
//  OtherLayerViewController.h
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-11.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OtherLayerViewController : UIViewController

@property (retain, nonatomic) CALayer *myLayer;

@property (retain, nonatomic) CAShapeLayer *shapeLayer;
@property (retain, nonatomic) CAGradientLayer *gradientLayer;
@property (retain, nonatomic) CAReplicatorLayer*replicatorLayer;

- (IBAction)actionDefault:(id)sender;

- (IBAction)actionMask:(id)sender;
- (IBAction)actionMaskStroke:(id)sender;
- (IBAction)actionGradient:(id)sender;
- (IBAction)actionReplicator:(id)sender;
- (IBAction)actionReplicator1:(id)sender;

- (IBAction)actionScreenShot:(id)sender;

- (IBAction)actionAnimation:(id)sender;

@end
