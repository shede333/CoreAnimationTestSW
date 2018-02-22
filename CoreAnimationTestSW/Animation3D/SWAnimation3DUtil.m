//
//  SWAnimation3DUtil.m
//  CoreAnimationTestSW
//
//  Created by shaowei on 11/10/14.
//  Copyright (c) 2014 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "SWAnimation3DUtil.h"

void log3DLine(NSInteger charWidth, CGFloat l0, CGFloat l1, CGFloat l2, CGFloat l3);
void log3DMValue(CGFloat mValue, NSInteger charWidth);

CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
//    CATransform3D test = CATransform3DConcat(transToCenter, scale);
//    CATransform3D test1 = CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}


void _log3DTransform(CATransform3D transform,  NSString *strValue){
    printf("\n%s:\n", [strValue UTF8String]);
    NSInteger charWidth = 10;
    
    log3DLine(charWidth, transform.m11, transform.m12, transform.m13, transform.m14);
    log3DLine(charWidth, transform.m21, transform.m22, transform.m23, transform.m24);
    log3DLine(charWidth, transform.m31, transform.m32, transform.m33, transform.m34);
    log3DLine(charWidth, transform.m41, transform.m42, transform.m43, transform.m44);
    
    printf("\n");
}

void log3DLine(NSInteger charWidth, CGFloat l0, CGFloat l1, CGFloat l2, CGFloat l3){
    log3DMValue(l0, charWidth);
    log3DMValue(l1, charWidth);
    log3DMValue(l2, charWidth);
    log3DMValue(l3, charWidth);
    printf("\n");
}

void log3DMValue(CGFloat mValue, NSInteger charWidth){
    NSString *str = [NSString stringWithFormat:@"%.5f",mValue];
    if (str.length < charWidth) {
        NSInteger chaValue = charWidth - str.length;
        for (NSInteger i = 0; i < chaValue; i++) {
            str = [str stringByAppendingString:@" "];
        }
    }else if(str.length > charWidth){
        str = [str substringToIndex:charWidth];
    }
    
    printf("%s, ",[str UTF8String]);
}

//@implementation SWAnimation3DUtil
//
//@end
