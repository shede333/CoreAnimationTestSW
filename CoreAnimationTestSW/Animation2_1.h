//
//  Animation2_1.h
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-6-18.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Animation2_1 : UIViewController{
    CALayer *myLayer;
}

@property (retain, nonatomic) IBOutlet UISegmentedControl *mySegment;



- (IBAction)actionValueChange:(id)sender;

- (IBAction)ActionSegment:(id)sender;
- (IBAction)actionSwitvh:(id)sender;

@end
