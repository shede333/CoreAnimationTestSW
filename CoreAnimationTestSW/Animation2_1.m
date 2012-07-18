//
//  Animation2_1.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-6-18.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "Animation2_1.h"


@interface Animation2_1 ()

- (void)testAnimation;
- (void)testAnimation1;

@end

@implementation Animation2_1
@synthesize mySegment;

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
    [self testAnimation];
    [self testAnimation1];
}

- (void)viewDidUnload
{
    [self setMySegment:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)testAnimation{
    CALayer *layer1 = [CALayer creatLayer];
    [self.view.layer addSublayer:layer1];
    
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation.duration = 3.0f;
    
    [animation setFromValue:(id)[UIColor blueColor].CGColor];
    [animation setToValue:(id)[UIColor redColor].CGColor];
    
    animation.repeatCount = HUGE_VALF;
    animation.autoreverses = YES;
    
    [layer1 addAnimation:animation forKey:@"11"];
    
    
}

- (void)testAnimation1{
    CALayer * layer = [CALayer creatLayer];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"balloon" ofType:@"jpg"];
    UIImage *imageTmp = [UIImage imageWithContentsOfFile:path];
    layer.contents = (id)imageTmp.CGImage;
    layer.anchorPoint = CGPointMake(0, 0);
    float scale = 0.4f;
    layer.bounds = CGRectMake(0, 0, imageTmp.size.width * scale, imageTmp.size.height * scale);
    layer.contentsScale = 2.1f; //这个是什么意思？不懂!
//    layer.contentsCenter= CGRectMake(0, 0, 0.5f, 0.5f);
    layer.position = CGPointMake(20, 20);
    myLayer = layer;
    
    [self.view.layer addSublayer:myLayer];
    
}

- (IBAction)actionValueChange:(id)sender {
    if ([sender isKindOfClass:[UISlider class]]) {
        UISlider *slider = (UISlider *)sender;
        CGRect frame;
        
        switch (self.mySegment.selectedSegmentIndex) {
            case 0:
                frame = myLayer.contentsRect;
                break;
            case 1:
                frame = myLayer.contentsCenter;
                break;
                
            default:
                break;
        }
        
        
        switch (slider.tag) {
            case 0:
                frame.origin.x = slider.value;
                break;
            case 1:
                frame.origin.y = slider.value;
                break;
            case 2:
                frame.size.width = slider.value;
                break;
            case 3:
                frame.size.height = slider.value;
                break;
                
            default:
                [NSException exceptionWithName:@"error" reason:@"switch - tag no exist" userInfo:nil];
                break;
        }
        
        switch (self.mySegment.selectedSegmentIndex) {
            case 0:
                myLayer.contentsRect = frame;
                break;
            case 1:
                myLayer.contentsCenter = frame;
                break;
                
            default:
                break;
        }
        
        
    }
    
//    myLayer.mask
    
    
}

- (IBAction)ActionSegment:(id)sender {
    
}

- (IBAction)actionSwitvh:(id)sender {
    
    if ([sender isKindOfClass:[UISwitch class]]) {
        UISwitch *subSwitch = (UISwitch *)sender;
        if (subSwitch.on) {
            CALayer *maskLayer = [CALayer layer];
            [maskLayer setBounds:CGRectMake(0, 0, myLayer.bounds.size.width * 0.5f, myLayer.bounds.size.height * 0.5f)];
            [maskLayer setPosition:CGPointMake(myLayer.bounds.size.width * 0.5f, myLayer.bounds.size.height * 0.5f)];
            
            [maskLayer setBackgroundColor:[UIColor whiteColor].CGColor];    
            [maskLayer setOpacity:1.0];
            [myLayer setMask:maskLayer];
        }else {
            [myLayer setMask:nil];
        }
    }
}
- (void)dealloc {
    [mySegment release];
    [super dealloc];
}
@end
