//
//  CoreAnimationViewController.m
//  CoreAnimationTestSW
//
//  Created by Zhihuiguan Zhihuiguan on 12-6-4.
//  Copyright (c) 2012年 苏州知惠馆信息系统有限公司. All rights reserved.
//

#import "CoreAnimationViewController.h"

#import "BasicViewController.h"
#import "KeyFrameViewController.h"
#import "ContextArcViewController.h"
#import "GraphicsViewController.h"
#import "Animation2_1.h"
#import "Animation3_1.h"
#import "Animation4_1.h"
#import "KeyFrameValue.h"
#import "AnimationPauseViewController.h"
#import "mediaTimingViewController.h"
#import "OtherLayerViewController.h"
#import "ReplicatorViewController.h"
#import "AppReplicatorViewController.h"
#import "DrawCircleViewController.h"
#import "CustomPropertyViewController.h"
#import "Animation3DController.h"

@interface CoreAnimationViewController ()

- (void)myAddMArr;

@end


@implementation CoreAnimationViewController
@synthesize myTableView;
@synthesize mArr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
//    NSString *const sString = @"s";
//    const NSString *ssString = @"sd";
    
  
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self myAddMArr];
    
}

- (void)viewDidUnload
{
    [self setMyTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    
    [mArr release];
    [myTableView release];
    [super dealloc];
}

#pragma mark - Function - Private

- (void)myAddMArr{
    mArr = [[NSMutableArray alloc] initWithCapacity:20];
    
    [mArr addObject:@{@"class_name":@"Animation3DController",
                      @"title":@"Animation3DController"}];
    [mArr addObject:@{@"class_name":@"BasicViewController",
                      @"title":@"Basic"}];
    [mArr addObject:@{@"class_name":@"KeyFrameViewController",
                      @"title":@"KeyFrame"}];
    [mArr addObject:@{@"class_name":@"ContextArcViewController",
                      @"title":@"ContextArc"}];
    [mArr addObject:@{@"class_name":@"GraphicsViewController",
                      @"title":@"GraphicsView"}];
    [mArr addObject:@{@"class_name":@"Animation2_1",
                      @"title":@"Animation2_1"}];
    [mArr addObject:@{@"class_name":@"Animation3_1",
                      @"title":@"Animation3_1"}];
    [mArr addObject:@{@"class_name":@"Animation4_1",
                      @"title":@"Animation4_1"}];
    [mArr addObject:@{@"class_name":@"KeyFrameValue",
                      @"title":@"KeyFrameValue"}];
    [mArr addObject:@{@"class_name":@"AnimationPauseViewController",
                      @"title":@"AnimationPause"}];
    [mArr addObject:@{@"class_name":@"mediaTimingViewController",
                      @"title":@"mediaTiming"}];
    [mArr addObject:@{@"class_name":@"OtherLayerViewController",
                      @"title":@"OtherLayer"}];
    [mArr addObject:@{@"class_name":@"ReplicatorViewController",
                      @"title":@"Replicator"}];
    [mArr addObject:@{@"class_name":@"AppReplicatorViewController",
                      @"title":@"AppReplicator"}];
    [mArr addObject:@{@"class_name":@"DrawCircleViewController",
                      @"title":@"DrawCircle"}];
    [mArr addObject:@{@"class_name":@"CustomPropertyViewController",
                      @"title":@"CustomProperty"}];
    
    
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [mArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *identifier = @"cellOfNumber";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [mArr objectAtIndex:indexPath.row][@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *class_str = mArr[indexPath.row][@"class_name"];
    UIViewController *tmpVC = [[NSClassFromString(class_str) alloc] initWithNibName:class_str bundle:nil];
    [self.navigationController pushViewController:tmpVC animated:YES];
    [tmpVC release];
}














@end
