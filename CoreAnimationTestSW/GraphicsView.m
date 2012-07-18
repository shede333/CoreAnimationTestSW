//
//  GraphicsViewControllerVIew.m
//  Graphics
//
//  Created by Zhihuiguan Zhihuiguan on 12-5-28.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "GraphicsView.h"

@interface GraphicsView()

//标记起始结束点
- (void)markWithStart:(CGPoint)startPoint andEnd:(CGPoint)endPoint andColor:(UIColor *)color;

- (void)drawTopPoint:(CGPoint)topPoint andText:(NSString *)stringOfShow andLineJoin:(CGLineJoin)lineJoin;

//创建路径path - 线条
- (void)creatPathOfLine;

//创建路径path - 矩形
- (void)creatPathOfRect;

//创建路径path - 矩形 - 多个
- (void)creatPathOfRectMuch;

//创建阴影 -1
- (void)creatShadow;

//创建阴影 -2 - 保存-恢复状态
- (void)creatShadow_2;

//创建梯度变换
- (void)creatGradient;

//创建梯度变换
- (void)creatGradientOfAngle;

//图形平移
- (void)creatShapeChange;

//图形平移 - CTM
- (void)creatShapeChangeCTM;

//图形缩放 +旋转 
- (void)creatShapeScale;

//图形缩放 +旋转 - CTM
- (void)creatShapeScaleCTM;

//画tab  path+gradient
- (void)creatTab;

@end

@implementation GraphicsView

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
    
    //画字符串
    UIColor *color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
    [color set];
    
    UIFont *hFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:20];
    NSString *hString = @"HelveticaNeue-Bold";
    
    [hString drawAtPoint:CGPointMake(40, 180) withFont:hFont];
    
    UIColor *color1 = [UIColor colorWithRed:0.11 green:0.22 blue:0.33 alpha:1];
    [color1 set];
    
    [hString drawInRect:CGRectMake(20, 20, 200, 140) withFont:hFont];
    
    CGColorRef colorRef = color1.CGColor;
    
    const float *component = CGColorGetComponents(colorRef);
    int num = CGColorGetNumberOfComponents(colorRef);
    
    for (int i = 0; i < num; i++) {
        NSLog(@"sw-2- %d - %f\n",i,component[i]);
    }
    
    //画图片
    
    UIImage *imageXcode = [UIImage imageNamed:@"xcode.png"];
    
    //    [self addSubview:[[UIImageView alloc] initWithImage:imageXcode]];
    
    
    [imageXcode drawInRect:CGRectMake(0, 0, 100, 100)];
    [imageXcode drawAtPoint:CGPointMake(0, 200)];
    
    //画路径
    
    [[UIColor blueColor] set];
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor redColor] set];
    
    CGContextSetLineWidth(context, 10);
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddLineToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 20, 200);
    CGContextStrokePath(context);
    
    
    //画 多线
    
    [self drawTopPoint:CGPointMake(160, 20) 
               andText:@"JoinBevel" 
           andLineJoin:kCGLineJoinBevel];
    
    [self drawTopPoint:CGPointMake(160, 130) 
               andText:@"JoinMiter" 
           andLineJoin:kCGLineJoinMiter];
    
    [self drawTopPoint:CGPointMake(160, 280) 
               andText:@"JoinRound" 
           andLineJoin:kCGLineJoinRound];
    
    //创建路径path - 线条
    [self creatPathOfLine];
    
    //创建路径path - 矩形
    [self creatPathOfRect];
    
    //创建路径path - 矩形 - 多个
    [self creatPathOfRectMuch];
    
    //创建阴影 -2 - 保存-恢复状态
    [self creatShadow_2];
    
    //创建阴影 -1 - 没有阴影的
    [self creatShadow];
    
    //创建梯度变换
    [self creatGradient];
    
    //创建梯度变换
    [self creatGradientOfAngle];
    
    //图形平移
    [self creatShapeChange];
    
    //图形平移 - CTM
    [self creatShapeChangeCTM];
    
    //图形缩放 +旋转 
    [self creatShapeScale];
    
    //图形缩放 +旋转 - CTM
    [self creatShapeScaleCTM];
    
    //画tab  path+gradient
    [self creatTab];
    
}

#pragma mark - Function

//标记起始结束点
- (void)markWithStart:(CGPoint)startPoint andEnd:(CGPoint)endPoint andColor:(UIColor *)color{
    CGContextRef context = UIGraphicsGetCurrentContext();
    //标记起始、结束点 - 黑线
    CGContextSaveGState(context);
    
    if (color == nil) {
        UIColor *colorOfStroke = [UIColor blackColor];
        [colorOfStroke set];
    }else {
        [color set]; 
    }
    
    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

- (void)drawTopPoint:(CGPoint)topPoint andText:(NSString *)stringOfShow andLineJoin:(CGLineJoin)lineJoin{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *color = [UIColor blueColor];
    [color set];
    CGContextSetLineWidth(context, 20);
    
    CGContextSetLineJoin(context, lineJoin);
    
    CGContextMoveToPoint(context, topPoint.x - 140, topPoint.y + 100);
    CGContextAddLineToPoint(context, topPoint.x, topPoint.y);
    CGContextAddLineToPoint(context, topPoint.x + 140, topPoint.y + 100);
    
    CGContextStrokePath(context);
    
    [[UIColor whiteColor] set];
    [stringOfShow drawAtPoint:CGPointMake(topPoint.x - 40, topPoint.y + 60) 
                     withFont:[UIFont boldSystemFontOfSize:30]];
}

//创建路径path - 线条
- (void)creatPathOfLine{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 320, 460);
    CGPathMoveToPoint(path, NULL, 320, 0);
    CGPathAddLineToPoint(path, NULL, 0, 460);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(context, path);
    [[UIColor greenColor] setFill];
    [[UIColor grayColor] setStroke];
    
    CGContextDrawPath(context, kCGPathStroke);
    
    CGPathRelease(path);
    
}

//创建路径path - 矩形
- (void)creatPathOfRect{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect frame = CGRectMake(10, 100, 100, 100);
    CGPathAddRect(path, NULL, frame);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    
    CGContextSetLineWidth(context, 10);
    
    [[UIColor brownColor] setStroke];
    [[UIColor yellowColor] setFill];
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGPathRelease(path);
    
    
}

//创建路径path - 矩形 - 多个
- (void)creatPathOfRectMuch{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect frame1 = CGRectMake(10, 220, 100, 200);
    CGRect frame2 = CGRectMake(40, 300, 30, 80);
    CGRect frame[2] = {frame1,frame2};
    CGPathAddRects(path, NULL, frame, 2);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    
    CGContextSetLineWidth(context, 10);
    
    [[UIColor yellowColor] setStroke];
    [[UIColor brownColor] setFill];
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGPathRelease(path);
}

//创建阴影 -1
- (void)creatShadow{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect frame = CGRectMake(200, 90, 50, 50);
    CGPathAddRect(path, NULL, frame);
    
    CGContextAddPath(context, path);
    
    [[UIColor yellowColor] setFill];
    
    CGContextDrawPath(context, kCGPathFill);
    
    CGPathRelease(path);
    
}

//创建阴影 -2 - 保存-恢复状态
- (void)creatShadow_2{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGContextSetShadowWithColor(context, CGSizeMake(20, 20), 20, [UIColor blackColor].CGColor);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGRect frame = CGRectMake(200, 10, 50, 50);
    CGPathAddRect(path, NULL, frame);
    
    CGContextAddPath(context, path);
    
    [[UIColor purpleColor] setFill];
    
    CGContextDrawPath(context, kCGPathFill);
    
    CGPathRelease(path);
    
    CGContextRestoreGState(context);
    
}

//创建梯度变换
- (void)creatGradient{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    UIColor *startColor = [UIColor yellowColor];
    CGFloat *startComponent = (CGFloat *)CGColorGetComponents(startColor.CGColor);
    
    UIColor *endColor = [UIColor blueColor];
    CGFloat *endComponent = (CGFloat *)CGColorGetComponents(endColor.CGColor);
    
    CGFloat component[8] = 
    {
        startComponent[0],
        startComponent[1],
        startComponent[2],
        startComponent[3],
        
        endComponent[0],
        endComponent[1],
        endComponent[2],
        endComponent[3],
    };
    
    CGFloat location[2] = { 0.0f,0.5f};
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, (const CGFloat *)&component, (const CGFloat*)&location, 2);
    
    CGColorSpaceRelease(colorSpace);
    
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    CGPoint startPoint = CGPointMake(screenSize.size.width/2 - 20, screenSize.size.height/2);
    CGPoint endPoint = CGPointMake(screenSize.size.width/2 + 20, startPoint.y);
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                startPoint,
                                endPoint,
                                0);
    
    CGGradientRelease(gradient);
    
}

//创建梯度变换
- (void)creatGradientOfAngle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    UIColor *startColor = [UIColor yellowColor];
    CGFloat *startComponent = (CGFloat *)CGColorGetComponents(startColor.CGColor);
    
    UIColor *endColor = [UIColor blueColor];
    CGFloat *endComponent = (CGFloat *)CGColorGetComponents(endColor.CGColor);
    
    CGFloat component[8] = 
    {
        startComponent[0],
        startComponent[1],
        startComponent[2],
        startComponent[3],
        
        endComponent[0],
        endComponent[1],
        endComponent[2],
        endComponent[3],
    };
    
    CGFloat location[2] = { 0.0f,01.0f};
    
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace,
                                                                 (const CGFloat *)&component,
                                                                 (const CGFloat*)&location,
                                                                 2);
    
    
    CGColorSpaceRelease(colorSpace);
    
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    CGPoint startPoint = CGPointMake(260,380);
    CGPoint endPoint = CGPointMake(300,420);
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                startPoint,
                                endPoint,
                                kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
    
    
    //标记起始、结束点 - 黑线
    [self markWithStart:startPoint andEnd:endPoint andColor:nil];
    
    //    CGContextSaveGState(context);
    //    UIColor *lineColor = [UIColor blackColor];
    //    [lineColor set];
    //    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    //    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
    //    CGContextStrokePath(context);
    //    CGContextRestoreGState(context);
}

//图形平移
- (void)creatShapeChange{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rect = CGRectMake(20, 20, 50, 50);
    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 100);
    
    CGPathAddRect(path, &transform, rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, path);
    
    UIColor *fillColor = [UIColor yellowColor];
    [fillColor setFill];
    UIColor *storeColor = [UIColor blackColor];
    [storeColor setStroke];
    CGContextSetLineWidth(context, 3);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGPathRelease(path);
    
    
    //标记起始、结束点 - 黑线
    CGPoint startPoint = CGPointMake(rect.origin.x, rect.origin.y);
    CGPoint endPoint = CGPointMake(rect.origin.x + 100, rect.origin.y + 100);
    [self markWithStart:startPoint andEnd:endPoint andColor:nil];
    
    //    CGContextSaveGState(context);
    //    UIColor *colorOfStroke = [UIColor blackColor];
    //    [colorOfStroke set];
    //    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y);
    //    CGContextAddLineToPoint(context, rect.origin.x + 100, rect.origin.y + 100);
    //    CGContextStrokePath(context);
    //    CGContextRestoreGState(context);
}

//图形平移 - CTM
- (void)creatShapeChangeCTM{
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rect = CGRectMake(120, 20, 50, 50);
    //    CGAffineTransform transform = CGAffineTransformMakeTranslation(100, 100);
    
    CGPathAddRect(path, NULL, rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, 100, 100);//可以把这句和下面一句兑换位置看一下效果
    CGContextAddPath(context, path);
    
    UIColor *fillColor = [UIColor yellowColor];
    [fillColor setFill];
    UIColor *storeColor = [UIColor blackColor];
    [storeColor setStroke];
    CGContextSetLineWidth(context, 3);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGPathRelease(path);
    
    
    //标记起始、结束点 - 黑线
    CGPoint startPoint = CGPointMake(rect.origin.x, rect.origin.y);
    CGPoint endPoint = CGPointMake(rect.origin.x + 100, rect.origin.y + 100);
    [self markWithStart:startPoint andEnd:endPoint andColor:nil];
    
    CGContextRestoreGState(context); //位置很重要啊
    
    //标记起始、结束点 - 黑线
    [self markWithStart:startPoint andEnd:endPoint andColor:[UIColor greenColor]];
}

//图形缩放 +旋转 
- (void)creatShapeScale{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rect = CGRectMake(20, 250, 100, 100);
    
    CGAffineTransform transform = CGAffineTransformMakeScale(0.5, 0.5);
    CGAffineTransform transform1 = CGAffineTransformMakeRotation(-M_PI_4);
    CGAffineTransform transform2 = CGAffineTransformConcat(transform, transform1);
    
    CGPathAddRect(path, &transform2, rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextAddPath(context, path);
    
    [[UIColor redColor] setFill];
    
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
    
    CGPathRelease(path);
    
    //    //标记起始、结束点 - 黑线
    //    CGPoint startPoint = CGPointMake(rect.origin.x, rect.origin.y);
    //    CGPoint endPoint = CGPointMake(rect.origin.x + 100, rect.origin.y + 100);
    //    [self markWithStart:startPoint andEnd:endPoint andColor:nil];
}

//图形缩放 +旋转 +旋转 - CTM
- (void)creatShapeScaleCTM{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGRect rect = CGRectMake(150, 250, 100, 100);
    
    //    CGAffineTransform transform = CGAffineTransformMakeScale(2, 2);
    
    CGPathAddRect(path, NULL, rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGContextScaleCTM(context, 0.5, 0.5);
    
    
    CGContextAddPath(context, path);
    
    CGContextRotateCTM(context, -M_PI_4);
    CGContextAddPath(context, path);
    
    [[UIColor greenColor] setFill];
    
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextRestoreGState(context);
    
    CGPathRelease(path);
    
    
    
    //    //标记起始、结束点 - 黑线
    //    CGPoint startPoint = CGPointMake(rect.origin.x, rect.origin.y);
    //    CGPoint endPoint = CGPointMake(rect.origin.x + 100, rect.origin.y + 100);
    //    [self markWithStart:startPoint andEnd:endPoint andColor:nil];
    //    
    //    CGContextRestoreGState(context);
    //    
    //    //标记起始、结束点 - 黑线
    //    [self markWithStart:startPoint andEnd:endPoint andColor:[UIColor greenColor]];
}

//画tab  path+gradient
- (void)creatTab{
    CGMutablePathRef path = CGPathCreateMutable();
    
    //    CGPoint top = CGPointMake(20, 20);
    //    CGPoint bottom = CGPointMake(10, 50);
    
    float leftTop = 20;
    float LeftBottom = 70;
    float leftUp = 20;
    float leftDown = 20;
    
    float topWidth = 60;
    float bottomWidth = 80;
    
    float radius = 15;
    
    CGPathMoveToPoint(path, NULL, leftDown, LeftBottom);
    CGPathAddLineToPoint(path, NULL, leftTop, leftUp + radius);
    CGPathAddArcToPoint(path, NULL, leftTop, leftUp, leftTop + radius, leftUp, radius);
    CGPathAddLineToPoint(path, NULL, leftTop + topWidth - radius, leftTop);
    CGPathAddArcToPoint(path, NULL, leftTop + topWidth, leftTop, leftTop + topWidth, leftTop + radius, radius);
    CGPathAddLineToPoint(path, NULL, leftDown + bottomWidth, LeftBottom);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextAddPath(context, path);

    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    //    CGContextSetRGBFillColor(<#CGContextRef context#>, <#CGFloat red#>, <#CGFloat green#>, <#CGFloat blue#>, <#CGFloat alpha#>)
    //    CGContextSetShadow(context, CGSizeMake(-12, -12), 28);
    CGContextSetShadowWithColor(context, CGSizeMake(-12, 12), 20, [UIColor blackColor].CGColor);
    CGContextFillPath(context);
    
    
    //    [[UIColor purpleColor] setStroke];
    //
    //    CGContextSetLineWidth(context, 5);
    //    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextRestoreGState(context);
    
    
    CGPathRelease(path);
    
    
    
}















@end
