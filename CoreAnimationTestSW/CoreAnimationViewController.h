//
//  CoreAnimationViewController.h
//  CoreAnimationTestSW
//
//  Created by Zhihuiguan Zhihuiguan on 12-6-4.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreAnimationViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (retain, nonatomic) IBOutlet UITableView *myTableView;
@property (retain, nonatomic) NSMutableArray *mArr;

@end
