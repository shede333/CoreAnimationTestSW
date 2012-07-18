//
//  ContextArcView.m
//  CoreAnimationTestSW
//
//  Created by Zhihuiguan Zhihuiguan on 12-6-8.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "ContextArcView.h"

@interface ContextArcView ()

- (void)myDrawArc;
- (void)myDraw;

@end

@implementation ContextArcView

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
    [self myDrawArc];
    [self myDraw];
    
}

/*
 
 最近老画圆，所以对CGContextAddArc的接触比较多。
 
 CGContextAddArc(Context, CGFloat x , CGFloat y, CGFloat radius, CGFloat startAngle , CGFloat endAngle, int clockwise);
 
 这个方法牛人门都很熟悉了，我只是记录我自己的。
 
 关于角度，由x,y可确定圆心坐标，而0,0角度位于圆心的正下方。
 
 startAngle是由0,0偏移的。
 
 偏移方向是由clockwise控制的，1为顺时针，0为逆时针。
 
 */

- (void)myDrawArc{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, 180, 250, 100, 0, M_PI_2, 0);
    CGContextSetLineWidth(context, 10);
    [[UIColor blueColor] setFill];
    [[UIColor redColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
    
}




/*
 iPhone中双缓冲的实现
 
 原理不复杂：
 
 　　1. 创建一个bitmap context
 
 　　2. 在bitmap context上画东西
 
 　　3. 通过bitmap context生成一个CGImage
 
 　　4. 通过UIImage把CGImage内容画到屏幕上
 
 */

- (void)myDraw{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(nil, 27, 27, 8, 0, colorSpace, kCGImageAlphaPremultipliedLast);
    CGColorSpaceRelease(colorSpace);
    CGContextSetFillColor(context, CGColorGetComponents([UIColor blackColor].CGColor));
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 8, 13);
    CGContextAddLineToPoint(context, 24, 4);
    CGContextAddLineToPoint(context, 24, 22);
    CGContextClosePath(context);
    
    CGContextFillPath(context);
    
    CGImageRef imageRef = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    UIImage *myImage = [UIImage imageWithCGImage:imageRef];
    [myImage drawInRect:CGRectMake(0, 0, 120, 160)];
}


@end
