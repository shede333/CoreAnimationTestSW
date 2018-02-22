//
//  Animation3DController.m
//  CoreAnimationTestSW
//
//  Created by shaowei on 11/10/14.
//  Copyright (c) 2014 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "Animation3DController.h"
#import "CoordinateLineUtil.h"
#import "UIView+Sizes.h"
#import "SWAnimation3DUtil.h"

@interface Animation3DController()

@property (nonatomic, strong) UIView *testView;
@property (nonatomic, strong) UILabel *labelOfRSlider;
@property (nonatomic, strong) UISlider *rotationSlider;
@property (nonatomic, strong) UISlider *zSlider;
@property (nonatomic, strong) UILabel *labelOfzSlider;
@property (nonatomic, strong) UIImageView *testImageView;
@property (nonatomic, strong) UISlider *imageSlider;
@property (nonatomic, strong) UILabel *labelOfImageSlider;

@end

@implementation Animation3DController

- (void)viewDidLoad{
    [super viewDidLoad];
    
//    [self setupCoordinateLine];
    
    [self setupUI];
    
    [self setupAnimationRotation];
    
}

#pragma mark - animation{

- (void)animationWithAngle:(CGFloat)angle{
    CATransform3D rotate = CATransform3DMakeRotation(angle*M_PI/180.0f, 1, 0, 0);
    self.testView.layer.transform = CATransform3DPerspect(rotate, CGPointMake(0, -50), 200);
}

- (void)animationWithZdistance:(CGFloat)zDistance{
    
    CATransform3D zTranslation = CATransform3DMakeTranslation(0, 0, zDistance);
    self.testView.layer.transform = CATransform3DPerspect(zTranslation, CGPointMake(0, 0), 200);
    
}

#pragma mark - Function - Private

- (void)setupAnimationRotation{
    UIImageView *testImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sakula_l.png"]];
    self.testImageView = testImageView;
//    testImageView.centerX = self.view.width/2;
    testImageView.top = 50 + 20;
    testImageView.right = self.view.width;
    [self.view addSubview:testImageView];
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfHorizental
                               point:testImageView.top
                              toView:self.view];
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfHorizental
                               point:testImageView.bottom
                              toView:self.view];
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfVertical
                               point:testImageView.left
                              toView:self.view];
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfVertical
                               point:testImageView.right
                              toView:self.view];
    //角度滑条
    self.imageSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    _imageSlider.centerX = self.view.width/2;
    _imageSlider.top = _testImageView.bottom + 20;
    _imageSlider.continuous = YES;
    _imageSlider.minimumValue = -180;
    _imageSlider.maximumValue = _imageSlider.minimumValue * (-1);
    [_imageSlider setValue:0 animated:NO];
    [_imageSlider addTarget:self
               action:@selector(actionImageSlider:)
     forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: _imageSlider];
    
    self.labelOfImageSlider = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    _labelOfImageSlider.left = _imageSlider.right + 10;
    _labelOfImageSlider.centerY = _imageSlider.centerY;
    _labelOfImageSlider.font = [UIFont systemFontOfSize:11];
    _labelOfImageSlider.text = [NSString stringWithFormat:@"%.1f",_imageSlider.value];
    [self.view addSubview:_labelOfImageSlider];
    
    //add btn
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [testBtn setTitle:@"start" forState:UIControlStateNormal];
    testBtn.frame = CGRectMake(0, 0, 50, 50);
    testBtn.right = _imageSlider.left - 10;
    testBtn.centerY = _imageSlider.centerY;
    [self.view addSubview:testBtn];
    [testBtn addTarget:self
                action:@selector(actionRZ:)
      forControlEvents:UIControlEventTouchUpInside];
    
    
    //test
    self.zSlider.hidden = YES;
    self.testView.hidden = YES;
    self.rotationSlider.hidden = YES;
    
//    UIView *tmpView1 = [[UIView alloc] initWithFrame:_testImageView.frame];
//    tmpView1.backgroundColor = [UIColor grayColor];
//    tmpView1.left = _testImageView.right;
//    [self.view insertSubview:tmpView1 aboveSubview:_testImageView];
}

- (void)setupUI{
    self.testView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    self.testView.backgroundColor = [UIColor purpleColor];
    UILabel *tmpView = [[UILabel alloc] initWithFrame:_testView.bounds];
    tmpView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tmpView.textAlignment = NSTextAlignmentCenter;
    tmpView.text = @"hello";
    tmpView.font = [UIFont systemFontOfSize:29];
    [_testView addSubview:tmpView];
    [self.view addSubview:_testView];
    NSLog(@"anchor:%@,layer_bound:%@,layer_point:%@,frame:%@",NSStringFromCGPoint(_testView.layer.anchorPoint) , NSStringFromCGRect(_testView.layer.bounds),NSStringFromCGPoint(_testView.layer.position),NSStringFromCGRect(self.testView.frame));
    self.testView.layer.anchorPoint = CGPointMake(0.5f, 1);
    NSLog(@"anchor:%@,layer_bound:%@,layer_point:%@,frame:%@",NSStringFromCGPoint(_testView.layer.anchorPoint) ,NSStringFromCGRect(_testView.layer.bounds),NSStringFromCGPoint(_testView.layer.position),NSStringFromCGRect(self.testView.frame));
//    _testView.frame = CGRectMake(100, 100, 100, 100);
    _testView.layer.position = CGPointMake(150, 200);
    NSLog(@"anchor:%@,layer_bound:%@,layer_point:%@,frame:%@",NSStringFromCGPoint(_testView.layer.anchorPoint) ,NSStringFromCGRect(_testView.layer.bounds),NSStringFromCGPoint(_testView.layer.position),NSStringFromCGRect(self.testView.frame));
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    slider.centerX = [[UIScreen mainScreen] bounds].size.width/2;
    slider.top = _testView.bottom + 50;
    slider.continuous = YES;
    slider.minimumValue = -180;
    slider.maximumValue = slider.minimumValue * (-1);
    [slider setValue:0 animated:NO];
    [slider addTarget:self
               action:@selector(actionRotationSlider:)
     forControlEvents:UIControlEventValueChanged];
    [self.view addSubview: slider];
    self.rotationSlider = slider;
    
    //方向滑条
    self.labelOfRSlider = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    _labelOfRSlider.left = slider.right + 10;
    _labelOfRSlider.centerY = slider.centerY;
    _labelOfRSlider.font = [UIFont systemFontOfSize:11];
    _labelOfRSlider.text = [NSString stringWithFormat:@"%.1f",slider.value];
    [self.view addSubview:_labelOfRSlider];
    
    //z轴滑条
    self.zSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    self.zSlider.centerX = _rotationSlider.centerX;
    self.zSlider.top = _rotationSlider.bottom + 5;
    self.zSlider.continuous = YES;
    _zSlider.minimumValue = -200;
    _zSlider.maximumValue = _zSlider.minimumValue * (-1);
    [_zSlider setValue:0 animated:NO];
    [_zSlider addTarget:self
                 action:@selector(actionZslider:)
       forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_zSlider];
    
    self.labelOfzSlider = [[UILabel  alloc] initWithFrame:CGRectMake(0, 0, 50, 35)];
    _labelOfzSlider.font = _labelOfRSlider.font;
    _labelOfzSlider.text = [NSString stringWithFormat:@"%.1f",_zSlider.value];
    _labelOfzSlider.left = _zSlider.right + 10;
    _labelOfzSlider.centerY = _zSlider.centerY;
    [self.view addSubview:_labelOfzSlider];
    
    
    
    
    
}

- (void)setupCoordinateLine{
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfHorizental
                               point:99
                              toView:self.view];
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfHorizental
                               point:200
                              toView:self.view];
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfHorizental
                               point:150
                              toView:self.view];
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfHorizental
                               point:(200-34)
                              toView:self.view];
    
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfVertical
                               point:99
                              toView:self.view];
    [CoordinateLineUtil addLineStyle:CoordinateLineStyleOfVertical
                               point:200
                              toView:self.view];
}

#pragma mark - action



- (void)actionRZ:(id)sender{
    
    _testImageView.layer.transform = CATransform3DIdentity;
    CGFloat changeValue = 180;
    CGFloat angle = -40 *1.0f*M_PI/180.0f;
    CGFloat scale = 1.0f - changeValue*1.0f/400;
//    CGFloat z_dis = changeValue*(-1.0f*50/180.0f);
    CGFloat x_dis = changeValue*(1.0f*80/180.0f);
    
    CATransform3D t_rotate0 = CATransform3DMakeRotation(angle, 0, 1, 0);
    CATransform3D t_translate = CATransform3DTranslate(t_rotate0, x_dis, 0, 0);
    CATransform3D t_scale = CATransform3DScale(t_translate, scale, scale, 1);
    
    CALayer *layer = [_testImageView layer];
    CGPoint oldAnchorPoint = layer.anchorPoint;
    _testImageView.layer.anchorPoint = CGPointMake(1, 0.5f);
    [layer setPosition:CGPointMake(layer.position.x + layer.bounds.size.width * (layer.anchorPoint.x - oldAnchorPoint.x), layer.position.y + layer.bounds.size.height * (layer.anchorPoint.y - oldAnchorPoint.y))];
    
    CGPoint cameraCenter = CGPointMake(-_testImageView.width/2, 0);
    
    
    [UIView animateWithDuration:0.3f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         _testImageView.layer.transform = CATransform3DPerspect(t_scale, cameraCenter, 200);
                     } completion:^(BOOL finished) {
                         NSLog(@"animation finish");
                     }];
    
}

- (void)actionImageSlider:(id)sender{
    
    UISlider *slider = (UISlider *)sender;
    CGFloat changeValue = slider.value;
    
    CGFloat angle = -changeValue*(40.0f/180) *1.0f*M_PI/180.0f;
    CGFloat scale = 1.0f - changeValue*1.0f/400;
    CGFloat z_dis = changeValue*(-1.0f*50/180.0f);
    CGFloat x_dis = changeValue*(1.0f*50/180.0f);
    

    CATransform3D t_rotate0 = CATransform3DMakeRotation(angle, 0, 1, 0);
    CATransform3D t_translate = CATransform3DTranslate(t_rotate0, x_dis, 0, 0);
    CATransform3D t_scale = CATransform3DScale(t_translate, scale, scale, 1);
    
    CALayer *layer = [_testImageView layer];
    CGPoint oldAnchorPoint = layer.anchorPoint;
    _testImageView.layer.anchorPoint = CGPointMake(1, 0.5f);
    [layer setPosition:CGPointMake(layer.position.x + layer.bounds.size.width * (layer.anchorPoint.x - oldAnchorPoint.x), layer.position.y + layer.bounds.size.height * (layer.anchorPoint.y - oldAnchorPoint.y))];
    
    
    CGPoint cameraCenter = CGPointMake(-_testImageView.width/2, 0);
    _testImageView.layer.transform = CATransform3DPerspect(t_scale, cameraCenter, 200);
    
    return;
    
    
//    UISlider *slider = (UISlider *)sender;
//    CGFloat changeValue = slider.value;
//    
//    
//    self.labelOfImageSlider.text = [NSString stringWithFormat:@"%.1f",changeValue];
//    
//    CGFloat angle = 1.0f*M_PI*changeValue/180.0f;
//    CGFloat zImage = 50;
//    CATransform3D move = CATransform3DMakeTranslation(0, 0, zImage);
//    CATransform3D back = CATransform3DMakeTranslation(0, 0, -zImage);
//    CATransform3D rotate0 = CATransform3DMakeRotation(angle, 0, 1, 0);
//    CATransform3D mat0 = CATransform3DConcat(CATransform3DConcat(move, rotate0), back);
//    log3DTransform(move);
//    log3DTransform(back);
//    log3DTransform(rotate0);
//    log3DTransform(CATransform3DConcat(move, rotate0));
//    log3DTransform(mat0);
//    log3DTransform(CATransform3DPerspect(mat0, CGPointZero, 200));
////    _testImageView.layer.transform = CATransform3DPerspect(mat0, CGPointZero, 200);
//    
//    CATransform3D m_z =  CATransform3DMakeTranslation(0, 0, changeValue);
//    log3DTransform(m_z);
//    _testImageView.layer.transform = CATransform3DPerspect(m_z,  CGPointZero, 200);
//    
//    
//    CGPoint center = CGPointZero;
//    CGFloat disZ = 200;
//    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);log3DTransform(transToCenter);
//    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);log3DTransform(transBack);
//    CATransform3D scale = CATransform3DIdentity;
//    scale.m34 = -1.0f/disZ;log3DTransform(scale);
//
//    CATransform3D z1 = CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);log3DTransform(z1);
//    CATransform3D z2 = CATransform3DConcat(m_z, z1);log3DTransform(z2);
//    CATransform3D finish = CATransform3DPerspect(z2,  CGPointZero, 200);log3DTransform(finish);
//    _testImageView.layer.transform = finish;
//    
}

- (void)actionRotationSlider:(id)sender{
    UISlider *slider = (UISlider *)sender;
    CGFloat changeValue = slider.value;
    [self animationWithAngle:changeValue];
    [self.labelOfRSlider setText:[NSString stringWithFormat:@"%.1f",changeValue]];
}

- (void)actionZslider:(id)sender{
    UISlider *slider = (UISlider *)sender;
    CGFloat changeValue = slider.value;
    [self animationWithZdistance:changeValue];
    [self.labelOfzSlider setText:[NSString stringWithFormat:@"%.1f",changeValue]];
}

@end
