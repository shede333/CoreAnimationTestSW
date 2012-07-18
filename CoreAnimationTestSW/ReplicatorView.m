//
//  ReplicatorView.m
//  CoreAnimationTestSW
//
//  Created by ZhiHuiGuan001 舍得 on 12-7-12.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "ReplicatorView.h"

@implementation ReplicatorView

- (id)initWithFrame:(CGRect)frame{
    if (!(self = [super initWithFrame:frame])) return nil;
    CGFloat reflectionBase =230.0f;
    CATransform3D transform =CATransform3DMakeScale(1.0, 1.0, 1.0);
    transform =CATransform3DTranslate(transform, 0.0, 90, 0.0);
    CAReplicatorLayer*replicatorLayer = (CAReplicatorLayer*)[self layer];
    [replicatorLayer setInstanceTransform:transform];
//    [replicatorLayer setInstanceRedOffset:-0.5];
//    [replicatorLayer setInstanceGreenOffset:-0.5];
//    [replicatorLayer setInstanceBlueOffset:-0.5];
    [replicatorLayer setInstanceAlphaOffset:-0.2];
    [replicatorLayer setInstanceCount:4];
    [replicatorLayer setInstanceDelay:1];
    
    return self; 
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

+ (Class)layerClass{
    return [CAReplicatorLayer class];
}

@end
