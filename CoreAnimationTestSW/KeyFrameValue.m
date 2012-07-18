//
//  KeyFrameValue.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-6-26.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "KeyFrameValue.h"

@interface KeyFrameValue ()

- (void)myTest;

@end

@implementation KeyFrameValue
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
    self.myLayer = [CALayer creatLayer];
    myLayer.bounds = CGRectMake(0, 0, 150, 150);
    [self.view.layer addSublayer:myLayer];
    myLayer.masksToBounds = YES;
    
    
    
    [self myTest];
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
    [myLayer release];
    [super dealloc];
}

- (void)myTest{
    
    
}





- (IBAction)actionContents:(id)sender {
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    
    NSMutableArray *mArr = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < 5; i ++) {
        NSString *name = [NSString stringWithFormat:@"shop_show_detail_%d",i];
        NSString *pathOfImage = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
        UIImage *imageTmp = [UIImage imageWithContentsOfFile:pathOfImage];
        [mArr addObject:(id)imageTmp.CGImage];
    }
    
    keyFrame.values = mArr;
    keyFrame.duration = 4;
    keyFrame.repeatCount = HUGE_VALF;
//    keyFrame.rotationMode = kCAAnimationRotateAuto;
    
    [myLayer addAnimation:keyFrame forKey:@"sdf"];
    
    [mArr release];
}

- (IBAction)actionTransform:(id)sender {
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D transform1 = CATransform3DMakeScale(2, 2, 0);
    CATransform3D transform2 = CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
    CATransform3D transform3 = CATransform3DMakeTranslation(50, 50, 0);
    
    CATransform3D transform4 = CATransform3DScale(CATransform3DIdentity, 1.5, 1.5, 1);
    CATransform3D transform5 = CATransform3DScale(CATransform3DIdentity, 2, 2, 1);
    
    
    keyFrame.values = [NSArray arrayWithObjects:[NSValue valueWithCATransform3D:CATransform3DIdentity],
                       [NSValue valueWithCATransform3D:transform4], 
                        [NSValue valueWithCATransform3D:transform5], nil];
    keyFrame.duration = 2;
    keyFrame.repeatCount = HUGE_VALF;
    keyFrame.autoreverses = YES;
    
    
    [myLayer addAnimation:keyFrame forKey:@"seedf"];
    
 
}



- (IBAction)actionTransaction:(id)sender {
    [myLayer removeAllAnimations];
    UISegmentedControl *seg = (UISegmentedControl *)sender;
    switch (seg.selectedSegmentIndex) {
        case 0:
        {
            [CATransaction begin];
            
            __block CALayer *layer = self.myLayer;
            [CATransaction setCompletionBlock:^{
                layer.transform = CATransform3DIdentity;
            }];
            [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
            
            myLayer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
            
            [CATransaction commit];
            
        }
            break;
        case 1:
        {
            [CATransaction begin];
//            [CATransaction setAnimationDuration:3.0f];
            __block CALayer *layer = self.myLayer;
            [CATransaction setCompletionBlock:^{
                layer.transform = CATransform3DIdentity;
            }];
            if ([CATransaction disableActions]) {
                NSLog(@"SW3- ");
            }
            [CATransaction setDisableActions:YES];
            
            myLayer.position = CGPointMake(50, 50);
            [myLayer setFillMode:kCAFillModeForwards];
            
//            [self.myLayer setOpacity:0];
            
            [CATransaction commit];
            
        }
            break;
        case 2:
        {
            [CATransaction begin];
            __block CALayer *layer = self.myLayer;
            [CATransaction setCompletionBlock:^{
                layer.transform = CATransform3DIdentity;
            }];
            [CATransaction setAnimationDuration:3.0f];
            
            myLayer.transform = CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
            
            [CATransaction commit];
            
        }
            break;

            
        default:
            break;
    }
    
}

- (IBAction)actionTest:(id)sender {
    CABasicAnimation *ani = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [ani setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [ani setDuration:2.0f];
    [ani setToValue:[NSNumber numberWithFloat:4*M_PI]];
    [ani setAutoreverses:YES];
    
    [myLayer addAnimation:ani forKey:@"sdvkj"];
    
}













@end
