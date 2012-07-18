//
//  CALayer+Creat.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-6-18.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "CALayer+Creat.h"

@implementation CALayer (Creat)

+ (CALayer *)creatLayer{
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    CGRect frame = [UIScreen mainScreen].bounds;
    layer.position = CGPointMake(CGRectGetWidth(frame) * 0.5f, CGRectGetHeight(frame) * 0.5f);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.cornerRadius = 10.0f;
    
    return layer;
}

@end
