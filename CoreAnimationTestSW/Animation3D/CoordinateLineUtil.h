//
//  CoordinateLineUtil.h
//  CoreAnimationTestSW
//
//  Created by shaowei on 11/10/14.
//  Copyright (c) 2014 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CoordinateLineStyle) {
    CoordinateLineStyleOfHorizental,
    CoordinateLineStyleOfVertical,
};

@interface CoordinateLineUtil : NSObject

+ (void)addLineStyle:(CoordinateLineStyle)style point:(CGFloat)point toView:(UIView *)rootView;

@end
