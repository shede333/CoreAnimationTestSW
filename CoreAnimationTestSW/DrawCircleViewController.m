//
//  DrawCircleViewController.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-18.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "DrawCircleViewController.h"

@interface DrawCircleViewController ()

@end

@implementation DrawCircleViewController

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
    myLayer = [CustomLayer creatLayer];
    [myLayer setBounds:CGRectMake(0, 0, 320, 400)];
//    [myLayer setContents:(id)[UIImage imageNamed:@"Soccer"].CGImage];
    

    [self.view.layer addSublayer:myLayer];
    [myLayer setNeedsDisplay];
    
    myLayer.delegate = self;
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
    myLayer.delegate = nil;
    [super dealloc];
}

#pragma mark - Layer - Delegate

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    NSLog(@"SW3-drawLayer inContext");
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 200, 200));
    
//    CGContextSetLineCap(ctx, kCGLineCapRound);
    CGContextSetLineWidth(ctx, 10);
    const float dashLength[10] = {60.,20.,50.,20.,40.,20.,30.,20.,20.,20.};
    CGContextSetLineDash(ctx, 0, dashLength, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    
    [self customDrawLine:ctx];
    
}

//- (void)displayLayer:(CALayer *)inContext{
//    NSLog(@"SW3-displayLayer ");
//}



#pragma mark - action
- (IBAction)actionLayer:(id)sender {
    [myLayer setNeedsDisplay];
}



- (void)customDrawLine:(CGContextRef )context{
    
    
    CGSize viewSize = self.view.bounds.size;
    
    CGMutablePathRef jumpPath = CGPathCreateMutable();
    CGPathMoveToPoint(jumpPath, NULL, 0., viewSize.height);
    CGPathAddCurveToPoint(jumpPath, NULL, 30., 140., 170., 140., 170., 200.);
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(context, jumpPath);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineWidth(context, 8);
    
    CGPathRelease(jumpPath);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    
}











@end
