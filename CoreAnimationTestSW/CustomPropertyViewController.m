//
//  CustomPropertyViewController.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-19.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "CustomPropertyViewController.h"



@interface CustomLayerTemp : CALayer

@property (nonatomic,assign) float margin;

@end

@implementation CustomLayerTemp
@synthesize margin;

+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"margin"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx{
//    static NSInteger i = 0;
//    i++;
//    NSLog(@"%s :%ld",__func__, (long)i);
    
    CGContextSaveGState(ctx);
    CGContextAddEllipseInRect(ctx, CGRectInset(self.bounds, margin, margin));
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(ctx, 6);
    const float length[2] = {20.0,15.0};
    CGContextSetLineDash(ctx, 0, length, 2);
    CGContextDrawPath(ctx, kCGPathStroke);
}

@end




@interface CustomPropertyViewController ()

@end

@implementation CustomPropertyViewController

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
    [self addAnimation];
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


#pragma mark - Function

- (void)addAnimation{
    CustomLayerTemp *layer = [CustomLayerTemp layer];
    layer.bounds = CGRectInset(self.view.bounds, 50, 100);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.position = self.view.center;
    layer.margin = 5;
    
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"margin"];
    animation.duration = 1;
    animation.fromValue = [NSNumber numberWithFloat:5.0f];
    animation.toValue = [NSNumber numberWithFloat:40.0f];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.autoreverses = YES;
    animation.repeatCount = HUGE_VALF;
    [layer addAnimation:animation forKey:@"1"];
    
    CABasicAnimation *animationTemp = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animationTemp.duration = 1;
    animationTemp.fromValue = [NSNumber numberWithFloat:0.0f];
    animationTemp.toValue = [NSNumber numberWithFloat:30.0f];
    animationTemp.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animationTemp.autoreverses = YES;
    animationTemp.repeatCount = HUGE_VALF;
    [layer addAnimation:animationTemp forKey:@"2"];
    
}









@end
