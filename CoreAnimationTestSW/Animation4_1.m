//
//  Animation4_1.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-6-21.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "Animation4_1.h"

@interface Animation4_1 ()

- (void)drawPath;

@end

@implementation Animation4_1
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
    [self drawPath];
    
    
    
    [self action:nil];
    
    
//    NSLog(@"SW3-M_PI %lf",M_PI* 0.25);
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

#pragma mark - Function



- (IBAction)action1:(id)sender {
    [myLayer removeAllAnimations];
    myLayer.anchorPoint = CGPointMake(0.0f, 1.0f);
    myLayer.position = CGPointMake(80, 300);
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D transform2To = CATransform3DMakeRotation(M_PI_4, 1.0f, 0, 0);
    animation2.toValue = [NSValue valueWithCATransform3D:transform2To];
    animation2.duration = 2.0f;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;

    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D transformFrom = CATransform3DMakeRotation(M_PI_2, 0.0f, 0.0f, 0.0f);
    CATransform3D transformTo = CATransform3DMakeRotation(M_PI_2, -1.0f, 1.0f, 0.0f);
    
    animation.fromValue = [NSValue valueWithCATransform3D:transform2To];
    animation.toValue = [NSValue valueWithCATransform3D:transformTo];
    animation.duration = 2;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.beginTime = 2.0f;

    
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    [group setAnimations:[NSArray arrayWithObjects:animation2,animation, nil]];
    group.duration = 4.0f;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.autoreverses = YES;
    group.repeatCount = HUGE_VALF;
    
    
    
    
    [myLayer addAnimation:group forKey:@"1"];
}

- (IBAction)actionPath:(id)sender {
    [self drawPath];

    myLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    myLayer.position = CGPointMake(80, 100);
    
    //路径曲线
    CGPoint fromPoint = myLayer.position;
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:myLayer.position];
    CGPoint toPoint = CGPointMake(300, 460);
    [movePath addQuadCurveToPoint:toPoint
                     controlPoint:CGPointMake(toPoint.x,fromPoint.y)];
    
    //关键帧
    CAKeyframeAnimation *moveAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    moveAnim.path = movePath.CGPath;
    moveAnim.duration = 2.0f;
    moveAnim.autoreverses = YES;
    moveAnim.removedOnCompletion = YES;
    [myLayer addAnimation:moveAnim forKey:@"path"];
    
    
    
}

- (IBAction)actionLeiJia:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D transformFrom = CATransform3DMakeRotation(M_PI_2, 0.0f, 0.0f, 0.0f);
    CATransform3D transformTo = CATransform3DMakeRotation(M_PI_4* 0.5f, 0.0f, 1.0f, 0.0f);
    
//    animation.fromValue = [NSValue valueWithCATransform3D:transform2To];
    animation.toValue = [NSValue valueWithCATransform3D:transformTo];
    animation.duration = 0.5f;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.cumulative = YES;
    animation.repeatCount = HUGE_VALF;
    
    [myLayer addAnimation:animation forKey:@"leijia"];
}

- (IBAction)action2:(id)sender {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    CATransform3D transformFrom = CATransform3DMakeRotation(M_PI_2, 0.0f, 0.0f, 0.0f);
    CATransform3D transformTo = CATransform3DMakeRotation(M_PI_4, -1.0f, 1.0f, 0.0f);
    
    //    animation.fromValue = [NSValue valueWithCATransform3D:transform2To];
    animation.toValue = [NSValue valueWithCATransform3D:transformTo];
    animation.duration = 2;
    animation.cumulative = YES;
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.removedOnCompletion = NO;
    animation.beginTime = 2.0f;
    
    animation.repeatCount = HUGE_VALF;
    
    [myLayer addAnimation:animation forKey:@"22"];
}

- (IBAction)actionUion:(id)sender {
//    myLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    [myLayer setTransform:CATransform3DIdentity];
    [myLayer removeAllAnimations];
    [CATransaction begin];
    [CATransaction setValue:[NSNumber numberWithFloat:3.0f] forKey:kCATransactionAnimationDuration];
    
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI, 0, 1.0f, 0);
    CATransform3D transform2 = CATransform3DMakeScale(0.4f, 0.4f, 1.0f);
    CATransform3D transform = CATransform3DConcat(transform1, transform2);
    
    [myLayer setTransform:transform];
    
    [CATransaction commit];
}

- (IBAction)action:(id)sender {
    if (myLayer != nil) {
        [myLayer removeFromSuperlayer];
    }
    self.myLayer = [CALayer layer];
    myLayer.anchorPoint = CGPointMake(0.0f, 1.0f);
    myLayer.cornerRadius = 10.0f;
    myLayer.position = CGPointMake(80, 300);
    myLayer.bounds = CGRectMake(0, 0, 160, 200);
    myLayer.backgroundColor = [UIColor blueColor].CGColor;
    myLayer.borderColor = [UIColor purpleColor].CGColor;
    myLayer.borderWidth = 3.0f;
    myLayer.shadowColor = [UIColor whiteColor].CGColor;
    myLayer.shadowOffset = CGSizeMake(-10, 10);
    myLayer.shadowRadius = 10.0f;
    myLayer.shadowOpacity = YES;
    
    UIImage *image = [UIImage imageNamed:@"StarMask"];
    
    myLayer.contents = (id)image.CGImage;
    
    [self.view.layer addSublayer:myLayer];
    
    
    
    
    CALayer *layer = [CALayer layer];
    layer.contents = (id)[UIImage imageNamed:@"Steve"].CGImage;
    layer.bounds = CGRectMake(0, 0, 80, 40);
    layer.position = CGPointMake(myLayer.bounds.size.width/2, myLayer.bounds.size.height/2);
    [myLayer addSublayer:layer];
}

- (IBAction)actionanch:(id)sender {
    if (CGPointEqualToPoint(myLayer.anchorPoint, CGPointMake(0.0f, 1.0f))) {
        myLayer.anchorPoint = CGPointMake(0.5f, 0.5f);
    }else {
        myLayer.anchorPoint = CGPointMake(0.0f, 1.0f);
    }
}

- (void)drawPath{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGPoint fromPoint = CGPointMake(80, 100);
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:myLayer.position];
    CGPoint toPoint = CGPointMake(300, 460);
    [movePath addQuadCurveToPoint:toPoint
                     controlPoint:CGPointMake(toPoint.x,fromPoint.y)];
    
    CGContextAddPath(context, movePath.CGPath);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextStrokePath(context);
    
//    CGContextAddLineToPoint(context, 0, 0);
//    CGContextDrawPath(<#CGContextRef c#>, <#CGPathDrawingMode mode#>)
    
    CGContextRestoreGState(context);
    [self.view setNeedsDisplay];
    
}








@end
