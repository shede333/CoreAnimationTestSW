//
//  SWAnimation3DUtil.h
//  CoreAnimationTestSW
//
//  Created by shaowei on 11/10/14.
//  Copyright (c) 2014 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

extern CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ);

extern CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ);

extern void _log3DTransform(CATransform3D transform, NSString *strValue);
#define log3DTransform(tranform3D) _log3DTransform(tranform3D, @""#tranform3D )

//@interface SWAnimation3DUtil : NSObject
//
//@end
