//
//  mediaTimingViewController.h
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-10.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mediaTimingViewController : UIViewController{
    
}

@property (retain, nonatomic) NSThread *myThread;

@property (retain, nonatomic) CALayer *myLayer;


@property (retain, nonatomic) IBOutletCollection(UIImageView) NSArray *imageOfSoccer;




- (IBAction)actionStart:(id)sender;
- (IBAction)actionTest:(id)sender;



@end
