//
//  ReplicatorViewController.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-16.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "ReplicatorViewController.h"
#import "math.h"


static int sTime_Delay = 1;

@interface ReplicatorViewController ()

@end

@implementation ReplicatorViewController
@synthesize replicatorX;
@synthesize replicatorY;
@synthesize replicatorZ;
@synthesize subLayer;

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
    self.view.backgroundColor = [UIColor blackColor];
    [self replicatorOfInit];
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
    [subLayer release];
    [replicatorZ release];
    [replicatorY release];
    [replicatorX release];
    [super dealloc];
}

#pragma mark - Function

#define Z_TIME_DELAY (0.15) 
#define X_TIME_DELAY (Z_TIME_DELAY * 5)
#define Y_TIME_DELAY (X_TIME_DELAY * 6)

- (void)replicatorOfInit{
    self.replicatorX = [CAReplicatorLayer layer];
    replicatorX.bounds = CGRectMake(0, 0, 200, 400);
    replicatorX.position = CGPointMake(160, 205);
    replicatorX.instanceDelay = X_TIME_DELAY;
    replicatorX.preservesDepth = YES;
    
    self.replicatorY = [CAReplicatorLayer layer];
    replicatorY.instanceDelay = Y_TIME_DELAY;
    replicatorY.preservesDepth = YES;
    
    self.replicatorZ = [CAReplicatorLayer layer];
    replicatorZ.instanceDelay = Z_TIME_DELAY;
    replicatorZ.preservesDepth = YES;
    
    self.subLayer = [CALayer layer];
    subLayer.backgroundColor = [UIColor whiteColor].CGColor;
    subLayer.borderWidth = 2.0f;
    subLayer.borderColor = [UIColor blueColor].CGColor;
    subLayer.bounds = CGRectMake(0, 0, 60, 50);
    subLayer.position = CGPointMake(60, 60);
    
    [replicatorZ addSublayer:subLayer];
    [replicatorY addSublayer:replicatorZ];
    [replicatorX addSublayer:replicatorY];
    
    [self.view.layer addSublayer:replicatorX];
    
    
    //Create a 3D perspective transform
	CATransform3D transformOfSubLayer = CATransform3DIdentity;
	transformOfSubLayer.m34 = 1.0 / -1000.0;
	
	//Rotate and reposition the camera
	transformOfSubLayer = CATransform3DTranslate(transformOfSubLayer, 0, 40, -210);
	transformOfSubLayer = CATransform3DRotate(transformOfSubLayer, 0.3, 1.0, -1.0, 0);
    
    self.view.layer.sublayerTransform = transformOfSubLayer;
    
    //Transform matrix to be used for camera animation
	CATransform3D transformOfLayer = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
	
	//Animate the camera panning left and right continuously
	CABasicAnimation *animation = [CABasicAnimation animation];
	animation.fromValue = [NSValue valueWithCATransform3D: CATransform3DIdentity];
	animation.toValue = [NSValue valueWithCATransform3D: transformOfLayer];
	animation.duration = 5;
	animation.removedOnCompletion = NO;
	animation.autoreverses = YES;
	animation.repeatCount = HUGE_VALF;
	animation.fillMode = kCAFillModeForwards;
	[replicatorX addAnimation:animation forKey:@"transform"];
    
    [self performSelector:@selector(animationOfAddReplicatorZ) withObject:nil afterDelay:2];
}

- (void)animationOfAddReplicatorX{
    replicatorX.instanceCount = 5;
    replicatorX.instanceRedOffset = -0.2f;
    
    [CATransaction setAnimationDuration:2.0f];
    replicatorX.instanceTransform = CATransform3DMakeTranslation(70, 0, 0);
    
    
}

- (void)animationOfAddReplicatorY{
    replicatorY.instanceCount = 5;
    replicatorY.instanceBlueOffset = -0.2f;
    
    [CATransaction setAnimationDuration:2.0f];
    replicatorY.instanceTransform = CATransform3DMakeTranslation(0, 70,0);
    
    [self performSelector:@selector(animationOfAddReplicatorX) withObject:nil afterDelay:6];
}

- (void)animationOfAddReplicatorZ{
    replicatorZ.instanceCount = 5;
    replicatorZ.instanceGreenOffset = -0.2f;
    
    [CATransaction setAnimationDuration:2.0f];
    replicatorZ.instanceTransform = CATransform3DMakeTranslation(0, 0, -80);
    [self performSelector:@selector(animationOfAddReplicatorY) withObject:nil afterDelay:6];
}











@end
