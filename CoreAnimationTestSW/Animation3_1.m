//
//  Animation3_1.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-6-19.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "Animation3_1.h"

@interface Animation3_1 ()

- (void)animationTest;
- (void)animationTest1;
- (void)animationIsFlip:(BOOL)isFlip;

@end

@implementation Animation3_1
@synthesize myLayer;

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
    [self animationTest1];
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


- (void)animationTest{
    
    if (myLayer == nil) {
        CALayer * layer = [CALayer creatLayer];
        self.myLayer = layer;
        [self.view.layer addSublayer:myLayer];
    }

    
    

    
    CABasicAnimation *animationBounds = [CABasicAnimation animationWithKeyPath:@"bounds"];
    animationBounds.duration = 3.0f;
//    animationBounds.fromValue = (id)[NSValue valueWithCGRect:CGRectMake(325, 415, 40, 20)];
    animationBounds.toValue = (id)[NSValue valueWithCGRect:CGRectMake(0, 0, 20, 40)];
    animationBounds.autoreverses = NO;
//    animationBounds.beginTime = 2;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 3.0f;
    animation.fromValue = (id)[NSValue valueWithCGPoint:myLayer.position];
    animation.toValue = (id)[NSValue valueWithCGPoint:CGPointMake(20, 30)];
    animation.autoreverses = NO;
    
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 3;
//    group.autoreverses = YES;
    
    [group setAnimations:[NSArray arrayWithObjects:animation,animationBounds, nil]];
    
    
    
    [myLayer setPosition:CGPointMake(20, 30)];
    
    [myLayer addAnimation:group forKey:nil];//执行setPosition默认动画
    [myLayer addAnimation:group forKey:@"sgd"];//执行 group动画;
    
}

- (void)animationTest1{
    CABasicAnimation *animationBounds = [CABasicAnimation animationWithKeyPath:@"frame.size"];
    animationBounds.duration = 3.0f;
    //    animationBounds.fromValue = (id)[NSValue valueWithCGRect:CGRectMake(325, 415, 40, 20)];
    animationBounds.toValue = (id)[NSValue valueWithCGSize:CGSizeMake(20, 40)];
    animationBounds.autoreverses = NO;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"frame.origin"];
    animation.duration = 3.0f;
    animation.toValue = (id)[NSValue valueWithCGPoint:CGPointMake(20, 30)];
    animation.autoreverses = NO;
    
    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 3;
    group.autoreverses = YES;
    
    [group setAnimations:[NSArray arrayWithObjects:animation,animationBounds, nil]];
    
//    [myLayer addAnimation:group forKey:@"sdfuf11i"];
    
    [myLayer addAnimation:animationBounds forKey:@"sgd1"];
    [myLayer addAnimation:animation forKey:@"sgd2"];
}

- (void)animationIsFlip:(BOOL)isFlip{
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithBool:!isFlip] forKey:kCATransactionDisableActions];
    if (isFlip) {
        [CATransaction setAnimationDuration:3];
    }
    
    myLayer.backgroundColor = [UIColor colorWithRed:arc4random()%10/10.0f
                                              green:arc4random()%10/10.0f
                                               blue:arc4random()%10/10.0f
                                              alpha:1.0f].CGColor;
    
    [CATransaction commit];
}

- (IBAction)actionSegment:(id)sender {
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segment = (UISegmentedControl *)sender;
        switch (segment.selectedSegmentIndex) {
            case 0:
                [self animationTest];
                break;
            case 1:
                [self animationTest1];
                break;
                
            default:
                break;
        }
    }
}

- (IBAction)actionSegment1:(id)sender {
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segment = (UISegmentedControl *)sender;
        switch (segment.selectedSegmentIndex) {
            case 0:
                [self animationIsFlip:YES];
                break;
            case 1:
                [self animationIsFlip:NO];
                break;
                
            default:
                break;
        }
    }
}

- (IBAction)actionHideAnimation:(id)sender {
//    隐式的重载了动画的时间
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:3] forKey:kCATransactionAnimationDuration];
    [myLayer setPosition:CGPointMake(300, 400)];
    
    
    [CATransaction commit];
}

- (IBAction)actionCompletion:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 30)];
    animation.duration = 3;
    
//    animation.timeOffset = 1;
    
    //动画完成后，保持最终位置表面上不变，但实际位置还是在原始
    [animation setFillMode:kCAFillModeForwards];
    [animation setRemovedOnCompletion:NO];
    
    [myLayer addAnimation:animation forKey:@"jsdio"];
}

- (IBAction)actionGroup:(id)sender {
//    myLayer.borderColor
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"borderWidth"];
    animation1.fromValue = [NSNumber numberWithFloat:0.0f];
    animation1.toValue = [NSNumber numberWithFloat:15.0f];
    animation1.duration = 3.0f;
    animation1.beginTime = 0.0f;
    [animation1 setFillMode:kCAFillModeForwards];
    [animation1 setRemovedOnCompletion:NO];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"borderColor"];
    animation2.fromValue = (id)[UIColor blackColor].CGColor;
    animation2.toValue = (id)[UIColor redColor].CGColor;
    animation2.duration = 3.0f;
    animation2.beginTime = 3.0f;
//    [animation2 setRemovedOnCompletion:NO];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 6;
    [group setAnimations:[NSArray arrayWithObjects:animation1,animation2, nil]];
//    [group setFillMode:kCAFillModeForwards];
//    [group setRemovedOnCompletion:NO];
    
    [myLayer addAnimation:group forKey:@"sd"];
    
}







@end
