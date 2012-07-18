//
//  OtherLayerViewController.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-11.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "OtherLayerViewController.h"
#import "ReplicatorView.h"

@interface OtherLayerViewController ()

@end

@implementation OtherLayerViewController
@synthesize shapeLayer;
@synthesize gradientLayer;
@synthesize replicatorLayer;
@synthesize myLayer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor blackColor]];
    [self creatReplicator];
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
    [replicatorLayer release];
//    [gradientLayer release];
//    [shapeLayer release];
    [super dealloc];
}

#pragma mark - Function
- (void)testFuc{
    UIImage *balloon = [UIImage imageNamed:@"balloon.jpg"];
    [[[self view] layer] setContents:(id)[balloon CGImage]];
    CGMutablePathRef path =CGPathCreateMutable(); 
    CGPathMoveToPoint(path, NULL, 0, 100);
    CGPathAddLineToPoint(path, NULL, 200, 0); 
    CGPathAddLineToPoint(path, NULL, 200,200); 
    CGPathAddLineToPoint(path, NULL, 0, 100);
//    CGPathAddLineToPoint(path, NULL, 200, 0); 
    CAShapeLayer *temp = [[CAShapeLayer alloc] init];
    self.shapeLayer = temp;
    [temp release];
    [shapeLayer setBounds:CGRectMake(0, 0, 200, 200)]; 
    [shapeLayer setFillColor:[[UIColor purpleColor] CGColor]]; 
    [shapeLayer setPosition:CGPointMake(200, 200)];
    [shapeLayer setPath:path];
    [shapeLayer setStrokeColor:[[UIColor redColor] CGColor]]; 
    [shapeLayer setLineWidth:10.0f];
    [shapeLayer setLineJoin:kCALineJoinMiter];
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:50], [NSNumber numberWithInt:15],
      nil]];
    
    shapeLayer.strokeStart = 0.2f;
    shapeLayer.lineCap = kCALineCapButt;
    [shapeLayer setLineDashPhase:10];
    
    [[[self view] layer]addSublayer:shapeLayer]; 
}



- (IBAction)actionDefault:(id)sender {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    [self testFuc];
}

- (IBAction)actionMask:(id)sender {
    
    [shapeLayer removeFromSuperlayer];
    [super viewDidLoad];
    UIImage *balloon = [UIImage imageNamed:@"balloon.jpg"]; 
    [[[self view] layer] setContents:(id)[balloon CGImage]];
    CGMutablePathRef path =CGPathCreateMutable(); 
    CGPathMoveToPoint(path, NULL, 0, 100);
    CGPathAddLineToPoint(path,NULL, 200, 0);
    CGPathAddLineToPoint(path, NULL, 200, 200);
    CGPathAddLineToPoint(path, NULL, 0, 100);
    shapeLayer = [[CAShapeLayer alloc] init];
    [shapeLayer setBounds:CGRectMake(0, 0, 200, 200)]; 
    [shapeLayer setFillColor:[[UIColor purpleColor] CGColor]]; 
    [shapeLayer setPosition:CGPointMake(200, 200)];
    [shapeLayer setPath:path];
    
//    [shapeLayer setBackgroundColor:[UIColor blueColor].CGColor];
    
    
    shapeLayer.strokeStart = 0.5f;
    
    
    [[[self view] layer]setMask:shapeLayer]; 
}

- (IBAction)actionMaskStroke:(id)sender {
    
    [shapeLayer removeFromSuperlayer];
    UIImage *balloon = [UIImage imageNamed:@"balloon.jpg"];
    [[[self view] layer] setContents:(id)[balloon CGImage]];
    CGMutablePathRef path =CGPathCreateMutable(); 
    CGPathMoveToPoint(path, NULL, 0, 100);
    CGPathAddLineToPoint(path,NULL, 200, 0); 
    CGPathAddLineToPoint(path, NULL, 200, 200);
    CGPathAddLineToPoint(path, NULL, 0, 100);
    shapeLayer = [[CAShapeLayer alloc] init];
    [shapeLayer setBounds:CGRectMake(0, 0, 200, 200)]; 
    [shapeLayer setFillColor:[[UIColor purpleColor]CGColor]]; 
    [shapeLayer setPosition:CGPointMake(200, 200)];
    [shapeLayer setPath:path];
    [shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
    [shapeLayer setLineWidth:10.0f];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:50], [NSNumber numberWithInt:20],
      nil]];
    [[[self view] layer]setMask:shapeLayer]; 
}

- (IBAction)actionGradient:(id)sender {
    
    CALayer *topLayer = [CALayer layer];
    [topLayer setBounds:CGRectMake(0, 0, 200, 200)];
    [topLayer setPosition:CGPointMake(160, 100)];
    [topLayer setContents:(id)[UIImage imageNamed:@"balloon.jpg"].CGImage];
//    [topLayer setValue:[NSNumber numberWithFloat:-0.5f] forKeyPath:@"transform.scale.y"];
//    [topLayer setValue:[NSNumber numberWithFloat:50.0f] forKeyPath:@"transform.translation.y"];
    [self.view.layer addSublayer:topLayer];
    
    CALayer *reflection = [CALayer layer];
    [reflection setBounds:CGRectMake(0, 0, 200, 200)];
    [reflection setPosition:CGPointMake(160, 300)];
    [reflection setContents:(id)[UIImage imageNamed:@"balloon.jpg"].CGImage];
    [reflection setValue:[NSNumber numberWithDouble:M_PI] forKeyPath:@"transform.rotation.x"];
    
    gradientLayer = [CAGradientLayer layer];
    [gradientLayer setBounds:reflection.bounds];
    [gradientLayer setPosition:CGPointMake(reflection.bounds.size.width*0.5f, reflection.bounds.size.height*0.5f)];
    NSArray *arrTemp = [NSArray arrayWithObjects:(id)[UIColor clearColor].CGColor,(id)[UIColor blueColor].CGColor, nil];
    [gradientLayer setColors:arrTemp];
    [gradientLayer setStartPoint:CGPointMake(0.5f, 0.35f)];
    [gradientLayer setEndPoint:CGPointMake(0.5f, 1.0f)];
//    [reflection addSublayer:gradientLayer];
    [reflection setMask:gradientLayer];
    
    [self.view.layer addSublayer:reflection];
}

- (IBAction)actionReplicator:(id)sender {
    

    UIView *replicatorView = nil;
    replicatorView = [[ReplicatorView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    [self.view addSubview:replicatorView];
    UIImage *lacey = [UIImage imageNamed:@"balloon.jpg"];
    UIImageView *imageView =[[UIImageView alloc] initWithImage:lacey];
    [imageView setFrame:CGRectMake(0, 0, 80, 80)];
//    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [replicatorView addSubview:imageView];

    [imageView release],imageView = nil;
    [replicatorView release],replicatorView = nil; 
    
    
    
    
//    BOOL isEqual = CATransform3DEqualToTransform(CATransform3DMakeScale(1, -1, 1), CATransform3DMakeRotation(M_PI, 1, 0, 0));

}

- (void)creatReplicator{
    
    self.replicatorLayer = [CAReplicatorLayer layer];
    [replicatorLayer setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.3].CGColor];
    [replicatorLayer setBounds:CGRectMake(0, 0, 80, 320)];
    replicatorLayer.anchorPoint = CGPointMake(0, 0);
    [replicatorLayer setPosition:CGPointMake(180, 80)];
    
    

    [replicatorLayer setInstanceDelay:2];
//    [replicatorLayer setPreservesDepth:YES];
    
    [self.view.layer addSublayer:replicatorLayer];
    
    CALayer *subLayer = [CALayer layer];
    [subLayer setContents:(id)[UIImage imageNamed:@"Soccer"].CGImage];
    [subLayer setBounds:CGRectMake(0, 0, 50, 50)];
    subLayer.anchorPoint = CGPointMake(0, 0);
    
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:3];
    [replicatorLayer addSublayer:subLayer];
//    [CATransaction commit];
}

- (IBAction)actionReplicator1:(id)sender {
//    CATransform3D transform =CATransform3DMakeScale(1.0, 1.0, 1.0);
    
    [CATransaction setAnimationDuration:3];
    
    CATransform3D transform =CATransform3DMakeTranslation(0, 90, 0);
    [replicatorLayer setInstanceTransform:transform];
    [replicatorLayer setInstanceRedOffset:-0.5];
    //    [replicatorLayer setInstanceGreenOffset:-0.5];
    //    [replicatorLayer setInstanceBlueOffset:-0.5];
    [replicatorLayer setInstanceAlphaOffset:-0.2];
    [replicatorLayer setInstanceCount:4];
   
    
    
}

- (IBAction)actionScreenShot:(id)sender {
    UIImage *imageTemp = [self getImage];
//    if (imageTemp == nil) {
//        NSLog(@"SW3- imageTemp nil");
//    }
    UIImageView *imageView = [[UIImageView alloc] initWithImage:imageTemp];
    [imageView setFrame:CGRectMake(50, 50, 100, 100)];
//    imageView.center = CGPointMake(50, 50);
    [self.view addSubview:imageView];
    [imageView release];
}

- (IBAction)actionAnimation:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSAssert([btn isKindOfClass:[UIButton class]],@"不是UIButton类型");
    
    if (myLayer == nil) {
        self.myLayer = [CALayer layer];
        [myLayer setBounds:CGRectMake(0, 0, 50, 50)];
        [myLayer setBackgroundColor:[UIColor blueColor].CGColor];
        [self.view.layer addSublayer:myLayer];
        [myLayer setPosition:CGPointMake(280, 380)];
    }
    
    
    
    if (btn.tag == 1) {
//        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        
        [myLayer setPosition:CGPointMake(50, 50)];
//        [CATransaction commit];
    }
    
    if (btn.tag == 2) {
//        [CATransaction begin];
//        [CATransaction setDisableActions:NO];
        
        [myLayer setPosition:CGPointMake(50, 380)];
//        [CATransaction commit];
    }
}

- (UIImage *)getImage{
    UIGraphicsBeginImageContext(self.view.layer.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imagTmp = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imagTmp;
}

















@end
