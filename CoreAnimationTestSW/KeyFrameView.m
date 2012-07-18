//
//  KeyFrameView.m
//  CoreAnimationTestSW
//
//  Created by Zhihuiguan Zhihuiguan on 12-6-8.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "KeyFrameView.h"

@implementation KeyFrameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path,NULL,50.0,120.0);  
    CGPathAddCurveToPoint(path,NULL,50.0,275.0,150.0,275.0,150.0,120.0);  
    CGPathAddCurveToPoint(path,NULL,150.0,275.0,200.0,275.0,200.0,120.0);  
    CGPathAddCurveToPoint(path,NULL,200.0,275.0,250.0,275.0,250.0,120.0);  
    CGPathAddCurveToPoint(path,NULL,250.0,275.0,300.0,275.0,300.0,120.0);  
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    CGContextSetLineWidth(context, 10);
    [[UIColor redColor] setStroke];
//    [[UIColor brownColor] setFill];
    CGContextDrawPath(context, kCGPathStroke);
}


@end
