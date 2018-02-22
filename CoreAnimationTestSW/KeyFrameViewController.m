//
//  KeyFrameViewController.m
//  CoreAnimationTestSW
//
//  Created by Zhihuiguan Zhihuiguan on 12-6-8.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "KeyFrameViewController.h"

@interface KeyFrameViewController ()

- (CAKeyframeAnimation *)addKeyFrameAnimation;
- (CAAnimation *)addKeyFrameAnimation2;

@end

@implementation KeyFrameViewController

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
    
    CAAnimation *animation = [self addKeyFrameAnimation];
    CAAnimation *animation2 = [self addKeyFrameAnimation2];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:[NSArray arrayWithObjects:animation,animation2, nil]];
    group.duration = 10;
    group.autoreverses = YES;
    
    
    
    
    subLayer = [CALayer layer];
    subLayer.contents = (id)[UIImage imageNamed:@"Mario"].CGImage; 
    subLayer.bounds = CGRectMake(0, 0, 30, 30);
    subLayer.cornerRadius = 6;
    subLayer.position = CGPointMake(50, 120);
    subLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    
    [self.view.layer addSublayer:subLayer];
    
    [subLayer addAnimation:animation2 forKey:@"s"];

    
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

#pragma mark - My Function

- (CAKeyframeAnimation *)addKeyFrameAnimation{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,NULL,50.0,120.0);  
    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,150.0,120.0);  
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,200.0,275.0,200.0,120.0);  
    CGPathAddCurveToPoint(path,NULL,200.0,275.0,250.0,275.0,250.0,120.0);  
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,300.0,275.0,300.0,120.0);  
    
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [keyAnimation setPath:path];
    [keyAnimation setDuration:8.0f];
    [keyAnimation setAutoreverses:YES];
    [keyAnimation setCalculationMode:kCAAnimationLinear];
    
    [keyAnimation setKeyTimes:[NSArray arrayWithObjects:
                               [NSNumber numberWithFloat:0.0f],
                               [NSNumber numberWithFloat:0.5f],
                               [NSNumber numberWithFloat:0.60f],
                               [NSNumber numberWithFloat:0.75f],
                               [NSNumber numberWithFloat:1.0f], nil]];
    keyAnimation.rotationMode = kCAAnimationRotateAuto;
    
    CGPathRelease(path);
    return keyAnimation;
}

- (CAAnimation *)addKeyFrameAnimation2{
    CGPoint pt0 = CGPointMake(50.0, 120.0);  
    CGPoint pt1 = CGPointMake(50.0, 275.0);  
    CGPoint pt2 = CGPointMake(150.0, 275.0);  
    CGPoint pt3 = CGPointMake(150.0, 120.0);  
    CGPoint pt4 = CGPointMake(150.0, 275.0);  
    CGPoint pt5 = CGPointMake(250.0, 275.0);  
    CGPoint pt6 = CGPointMake(250.0, 120.0);  
    CGPoint pt7 = CGPointMake(250.0, 275.0);  
    CGPoint pt8 = CGPointMake(350.0, 275.0);  
    CGPoint pt9 = CGPointMake(350.0, 120.0);  
    CGPoint pt10 = CGPointMake(350.0, 275.0);  
    CGPoint pt11 = CGPointMake(450.0, 275.0);  
    CGPoint pt12 = CGPointMake(450.0, 120.0);  
    NSArray *values = [NSArray arrayWithObjects:  
                       [NSValue valueWithCGPoint:pt0],  
                       [NSValue valueWithCGPoint:pt1],  
                       [NSValue valueWithCGPoint:pt2],  
                       [NSValue valueWithCGPoint:pt3],  
                       [NSValue valueWithCGPoint:pt4],  
                       [NSValue valueWithCGPoint:pt5],  
                       [NSValue valueWithCGPoint:pt6],  
                       [NSValue valueWithCGPoint:pt7],  
                       [NSValue valueWithCGPoint:pt8],  
                       [NSValue valueWithCGPoint:pt9],  
                       [NSValue valueWithCGPoint:pt10],  
                       [NSValue valueWithCGPoint:pt11],  
                       [NSValue valueWithCGPoint:pt12],  
                       nil];  
    CAKeyframeAnimation  
    *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];  
    [animation setValues:values];  
    [animation setDuration:2.0];  
    [animation setAutoreverses:YES];  
    return animation;  
}

//-(IBAction)startAnimation:(id)sender; {
//    if( starPath ) {
//        // Reset our starPathCGMutablePathRef if // it has already run before CFRelease(starPath);
//        [self createPath];
//        [[[window contentView] layer]setNeedsDisplay]; 
//    }
//    // Define a path for the starshape.
//    CGMutablePathRef path =CGPathCreateMutable();
//    CGPathMoveToPoint(path,NULL,240.0, 280.0);
//    CGPathAddLineToPoint(path,NULL, 181.0, 99.0); 
//    CGPathAddLineToPoint(path, NULL, 335.0, 210.0);
//    CGPathAddLineToPoint(path, NULL, 144.0, 210.0);
//    CGPathAddLineToPoint(path,NULL, 298.0, 99.0); 
//    CGPathCloseSubpath(path);
//    CAKeyframeAnimation*animation = [CAKeyframeAnimation
//                                     animationWithKeyPath:@"position"];
//    [animation setDuration:10.0f]; 
//    [animation setDelegate:self];
//    // Set the animation’s path
//    [animation setPath:path]; //Release the path CFRelease(path);
//    [dotLayer addAnimation:animation forKey:@"position"];
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self
//                                  selector:@selector(legOne:) userInfo:nil
//                                   repeats:NO];
//    [NSTimer scheduledTimerWithTimeInterval:4.0
//                                     target:self selector:@selector(legTwo:) userInfo:nil
//                                    repeats:NO];
//    [NSTimer scheduledTimerWithTimeInterval:6.0 target:self
//                                  selector:@selector(legThree:)userInfo:nil
//                                   repeats:NO];
//    [NSTimer scheduledTimerWithTimeInterval:8.0 target:self
//                                  selector:@selector(legFour:)userInfo:nil
//                                   repeats:NO];
//    [NSTimer scheduledTimerWithTimeInterval:10.0 target:self
//                                  selector:@selector(legFive:)userInfo:nil
//                                   repeats:NO];
//    // Tell the root layer tocall drawLayer
//    [[[window contentView] layer]setNeedsDisplay];
//}
//
//- (void)legOne:(id)sender {
//    CGPathAddLineToPoint(starPath,NULL, 181.0, 99.0);
//    [[[window contentView] layer]setNeedsDisplay]; }
//- (void)legTwo:(id)sender {
//    CGPathAddLineToPoint(starPath,NULL, 335.0, 210.0);
//    [[[window contentView] layer]setNeedsDisplay]; }
//- (void)legThree:(id)sender {
//    CGPathAddLineToPoint(starPath,NULL, 144.0, 210.0);
//    [[[window contentView] layer]setNeedsDisplay]; }
//- (void)legFour:(id)sender {
//    CGPathAddLineToPoint(starPath,NULL, 298.0, 99.0);
//    [[[window contentView] layer]setNeedsDisplay]; }
//- (void)legFive:(id)sender {
//    CGPathCloseSubpath(starPath);
//    [[[window contentView] layer]setNeedsDisplay]; 
//}












- (IBAction)actionKeyFrame:(id)sender {
    CAKeyframeAnimation *keyFrame = [self addKeyFrameAnimation];
    keyFrame.duration = 5.0f;
    keyFrame.autoreverses = YES;
    [subLayer addAnimation:keyFrame forKey:@"keyFrame"];
}
@end
