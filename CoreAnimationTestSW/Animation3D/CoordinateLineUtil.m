//
//  CoordinateLineUtil.m
//  CoreAnimationTestSW
//
//  Created by shaowei on 11/10/14.
//  Copyright (c) 2014 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "CoordinateLineUtil.h"
#import "UIView+Sizes.h"

@implementation CoordinateLineUtil

+ (void)addLineStyle:(CoordinateLineStyle)style point:(CGFloat)point toView:(UIView *)rootView{
    UIView *lineView = [self getViewWithStyle:style point:point];
    [rootView addSubview:lineView];
}

+ (UIView *)getViewWithStyle:(CoordinateLineStyle)style point:(CGFloat)point{
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    lineView.clipsToBounds = NO;
    CGRect tmpFrame = lineView.frame;
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    UILabel *location = [[UILabel alloc] initWithFrame:CGRectZero];
    location.text = [NSString stringWithFormat:@"%.1f",point];
    location.font = [UIFont systemFontOfSize:10];
    location.backgroundColor = [UIColor grayColor];
    [location sizeToFit];
    [lineView addSubview:location];
    switch (style) {
        case CoordinateLineStyleOfHorizental:{
            //水平线
            lineView.backgroundColor = [UIColor redColor];
            tmpFrame.size.width = screenSize.width;
            tmpFrame.origin.y = point;
            if (point < location.frame.size.height) {
                location.top = 1;
            }else{
                location.bottom = 0;
            }
        }
            break;
        case CoordinateLineStyleOfVertical:{
            //垂直线
            lineView.backgroundColor = [UIColor greenColor];
            tmpFrame.size.height = screenSize.height;
            tmpFrame.origin.x = point;
            if (point < location.width) {
                location.left = 1;
            }else{
                location.right = 0;
            }
        }
            break;
        default:
            NSAssert2(0, @"%@ 类的方法 %@ 需要重写",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
            
    }
    
    lineView.frame = tmpFrame;
    
    return lineView;
    
}

@end
