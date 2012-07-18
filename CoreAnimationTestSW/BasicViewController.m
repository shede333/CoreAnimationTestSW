//
//  BasicViewController.m
//  CoreAnimationTestSW
//
//  Created by Zhihuiguan Zhihuiguan on 12-6-4.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "BasicViewController.h"


@interface BasicViewController ()

- (void)creatLayer;
- (void)creatAnimation;

@end

@implementation BasicViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatLayer];
    [self creatAnimation];
    
//    self.view.layer.cornerRadius = 20;
//    self.view.layer.position = CGPointMake(50, 50);
//    self.view.layer.bounds = CGRectMake(0, 0, 200, 300);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{

    [super dealloc];
}

#pragma mark - Function

- (void)creatLayer{
    myLayer = [CALayer layer];
    myLayer.backgroundColor = [UIColor grayColor].CGColor;
    myLayer.bounds = CGRectMake(0, 0, 200, 200);
    myLayer.position = self.view.center;
    myLayer.cornerRadius = 10;
    
    [self.view.layer addSublayer:myLayer];
}

- (void)creatAnimation{
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basic.toValue = [NSNumber numberWithFloat:1.5f];
    basic.duration = 2;
    basic.fillMode = kCAFillModeBoth;
//    basic.repeatCount = HUGE_VALF;
//    basic.repeatDuration = 3;
//    basic.autoreverses = YES;
//    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    
    CABasicAnimation *basicOfColor = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basicOfColor.beginTime = 1;
    basicOfColor.duration = 2;
    basicOfColor.fillMode = kCAFillModeForwards;
    basicOfColor.toValue = (id)[UIColor blueColor].CGColor;
    
    
    CABasicAnimation *basicOfRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    basicOfRotation.beginTime = 1.0f;
    basicOfRotation.duration = 2;
    basicOfRotation.fillMode = kCAFillModeBoth;
    basicOfRotation.toValue = [NSNumber numberWithFloat:M_PI_4];
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:basic,basicOfColor,basicOfRotation, nil];
    group.duration = 4.0f;
    group.repeatCount = HUGE_VALF;
    group.autoreverses = YES;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [myLayer addAnimation:group forKey:@"group"];
}













@end
