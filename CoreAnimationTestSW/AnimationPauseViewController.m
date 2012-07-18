//
//  AnimationPauseViewController.m
//  AnimationPause
//
//  Created by gamy on 12-1-5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "AnimationPauseViewController.h"
#import <QuartzCore/QuartzCore.h>



@implementation AnimationPauseViewController
@synthesize controlButton;
@synthesize soccer;

- (void)dealloc
{
    [soccer release];
    [controlButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)addAnimations
{
    //让足球来回移动
    CABasicAnimation *translation = [CABasicAnimation animationWithKeyPath:@"position"];
    translation.fromValue = [NSValue valueWithCGPoint:CGPointMake(24, 240)];
    translation.toValue = [NSValue valueWithCGPoint:CGPointMake(320- 24, 240)];
    translation.duration = 2;
    translation.repeatCount = HUGE_VALF;
    translation.autoreverses = YES;
    
    //让足球来回转动
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //kCAMediaTimingFunctionLinear 表示时间方法为线性，使得足球匀速转动
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    rotation.toValue = [NSNumber numberWithFloat:4 * M_PI];
    rotation.duration = 2;
    rotation.repeatCount = HUGE_VALF;
    rotation.autoreverses = YES;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:[NSArray arrayWithObjects:translation,rotation, nil]];
    
    
    [group setDuration:2];
    [group setRepeatCount:HUGE_VALF];
    [group setAutoreverses:YES];
    
    [soccer.layer addAnimation:group forKey:@"group"];
    
    
//    [soccer.layer addAnimation:rotation forKey:@"rotation"];
//    [soccer.layer addAnimation:translation forKey:@"translation"];
}

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self addAnimations];
}


- (void)viewDidUnload
{
    [self setSoccer:nil];
    [self setControlButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//暂停layer上面的动画
- (void)pauseLayer:(CALayer*)layer
{
    NSLog(@"SW3-layer.beginTime暂停-1 %f",layer.beginTime);
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
    time = pausedTime;
    NSLog(@"SW3-layer.beginTime暂停-2 %f",layer.beginTime);
    NSLog(@"SW3-pausedTime %f\n\n",pausedTime);
}

//继续layer上面的动画
- (void)resumeLayer:(CALayer*)layer
{
    NSLog(@"SW3-layer.beginTime继续 %f",layer.beginTime);
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    CFTimeInterval timeSincePause1 = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
  
    NSLog(@"SW3-timeSincePause,yunshi:%f,1: %f,0:%f,\n\n cc:%f,convert:%f\n\n",CACurrentMediaTime() - pausedTime,timeSincePause1,timeSincePause,CACurrentMediaTime(),[layer convertTime:CACurrentMediaTime() fromLayer:nil]);
    layer.beginTime = timeSincePause;
}

- (void)pauseSoccer
{
    isPause = YES;
    [controlButton setTitle:@"继续" forState:UIControlStateNormal];
    [self pauseLayer:soccer.layer];
}

- (void)resumeSoccer
{
    isPause = NO;
    [controlButton setTitle:@"暂停" forState:UIControlStateNormal];
    [self resumeLayer:soccer.layer];
}

- (IBAction)clickControlButton:(id)sender {
    if (isPause) {
        [self resumeSoccer];
    }else{
        [self pauseSoccer];
    }
}
@end
