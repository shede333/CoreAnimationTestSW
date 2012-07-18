//
//  Animation3_1.h
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-6-19.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Animation3_1 : UIViewController{
    
}
@property (retain, nonatomic) CALayer *myLayer;


- (IBAction)actionSegment:(id)sender;
- (IBAction)actionSegment1:(id)sender;
- (IBAction)actionHideAnimation:(id)sender;
- (IBAction)actionCompletion:(id)sender;
- (IBAction)actionGroup:(id)sender;

@end
