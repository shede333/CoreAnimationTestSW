//
//  mediaTimingViewController.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-10.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "mediaTimingViewController.h"

@interface mediaTimingViewController ()

@end

@implementation mediaTimingViewController
@synthesize imageOfSoccer;
@synthesize myLayer;
@synthesize myThread;

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
    
    CALayer * layer = [CALayer creatLayer];
    layer.contents = (id)[UIImage imageNamed:@"Soccer"].CGImage;
    self.myLayer = layer;
    [self.view.layer addSublayer:myLayer];
//    [self thread];
}

- (void)viewDidUnload
{
    [self setImageOfSoccer:nil];
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
    [myThread release];
    [imageOfSoccer release];
    [myLayer release];
    [super dealloc];
}

#pragma mark - action

- (IBAction)actionStart:(id)sender {
    
    CALayer *layer = self.view.layer;
    CFTimeInterval currentTime = CACurrentMediaTime();
    CFTimeInterval first = [layer convertTime:currentTime fromLayer:nil];
    NSLog(@"SW3-first %f,currentTime:%f",first,currentTime);
    
    CFTimeInterval layerAddTime = [layer.superlayer convertTime:currentTime fromLayer:nil];
    layer.beginTime =  10;
    CFTimeInterval second = [layer convertTime:currentTime fromLayer:nil];
    NSLog(@"SW3-second %f,layer.beginTime:%f",second,layer.beginTime);
    
    
    
    
    
}

- (IBAction)actionTest:(id)sender {
    CALayer *layer = self.myLayer;
    layer.fillMode = kCAFillModeBackwards;
    CFTimeInterval currentTime = CACurrentMediaTime();
    CFTimeInterval currentTimeInSuperLayer = [layer.superlayer convertTime:currentTime fromLayer:nil];
    layer.beginTime = currentTimeInSuperLayer + 2;
    NSLog(@"SW3-layer.beginTime %f",layer.beginTime);
    CFTimeInterval currentTimeInLayer = [layer convertTime:currentTimeInSuperLayer fromLayer:layer.superlayer];
    CFTimeInterval addTime = currentTimeInLayer;
    NSLog(@"SW3-addTime %f",addTime);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 3.0f;
    animation.fromValue = (id)[NSValue valueWithCGPoint:myLayer.position];
    animation.toValue = (id)[NSValue valueWithCGPoint:CGPointMake(20, 30)];
    animation.autoreverses = NO;
    animation.fillMode = kCAFillModeBackwards;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.fillMode = kCAFillModeBackwards;
    group.beginTime =addTime + 2;
    NSLog(@"SW3-group.beginTime %f",group.beginTime);
    group.animations = [NSArray arrayWithObject:animation];
    group.duration = 7;
//    animation.beginTime = 0.5;
    [layer addAnimation:group forKey:nil];
}

#pragma mark - Thread-Test
- (void)asynchronousSource{
    self.myThread = [NSThread currentThread];
    for (int i = 0; i < 10; i++) {
        
        NSLog(@"asynchronous input source run");
        
    }
    
    [[NSThread currentThread] cancel];
    
}

- (void)thread{
    
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
    
    [self performSelector:@selector(asynchronousSource) withObject:nil afterDelay:1];
    
    NSLog(@"me");
    
    BOOL done = NO;
    
    do{
        
        // Start the run loop but return after each source is handled.
        
        SInt32    result = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1, YES);
        
        
        
        // If a source explicitly stopped the run loop, or if there are no
        
        // sources or timers, go ahead and exit.
        
        if ((result == kCFRunLoopRunStopped) || (result == kCFRunLoopRunFinished)){
            done = YES;
            NSLog(@"thread Stopp finish");
        }
            
            
        
        if ([myThread isCancelled]) {
            
            done = YES;
            
            NSLog(@"thread exit");
            
        }
        
        // Check for any other exit conditions here and set the
        
        // done variable as needed.
        
    }
    
    while (!done);
    
    //    while (done) {
    
    //        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    
    //        if ([_myThread isCancelled]) {
    
    //            finish = NO;
    
    //            NSLog(@"thread exit");
    
    //        }
    
    //    }
    
    [pool release];
    
}



@end
