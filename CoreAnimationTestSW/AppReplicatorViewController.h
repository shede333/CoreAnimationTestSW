//
//  AppReplicatorViewController.h
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-16.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppReplicatorViewController : UIViewController{
    
    CAReplicatorLayer *replicatorX;
	CAReplicatorLayer *replicatorY;
	CAReplicatorLayer *replicatorZ;
	
	CALayer *subLayer;
}

@property (retain, nonatomic) CALayer *rootLayer;

@end
