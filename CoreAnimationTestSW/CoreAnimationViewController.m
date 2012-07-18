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
    
    cell.textLabel.text = [mArr objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            BasicViewController *basic = [[BasicViewController alloc] initWithNibName:@"BasicViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 1:
        {
            KeyFrameViewController *basic = [[KeyFrameViewController alloc] initWithNibName:@"KeyFrameViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 2:
        {
            ContextArcViewController *basic = [[ContextArcViewController alloc] initWithNibName:@"ContextArcViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 3:
        {
            GraphicsViewController *basic = [[GraphicsViewController alloc] initWithNibName:@"GraphicsViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 4:
        {
            Animation2_1 *basic = [[Animation2_1 alloc] initWithNibName:@"Animation2_1" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 5:
        {
            Animation3_1 *basic = [[Animation3_1 alloc] initWithNibName:@"Animation3_1" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 6:
        {
            Animation4_1 *basic = [[Animation4_1 alloc] initWithNibName:@"Animation4_1" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 7:
        {
            KeyFrameValue *basic = [[KeyFrameValue alloc] initWithNibName:@"KeyFrameValue" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 8:
        {
            AnimationPauseViewController *basic = [[AnimationPauseViewController alloc] initWithNibName:@"AnimationPauseViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 9:
        {
            mediaTimingViewController *basic = [[mediaTimingViewController alloc] initWithNibName:@"mediaTimingViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 10:
        {
            OtherLayerViewController *basic = [[OtherLayerViewController alloc] initWithNibName:@"OtherLayerViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 11:
        {
            ReplicatorViewController *basic = [[ReplicatorViewController alloc] initWithNibName:@"ReplicatorViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 12:
        {
            AppReplicatorViewController *basic = [[AppReplicatorViewController alloc] initWithNibName:@"AppReplicatorViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        case 13:
        {
            DrawCircleViewController *basic = [[DrawCircleViewController alloc] initWithNibName:@"DrawCircleViewController" bundle:nil];
            [self.navigationController pushViewController:basic animated:YES];
            [basic release];
        }
            break;
        default:
            break;
    }
}

- (void)myAddMArr{
    mArr = [[NSMutableArray alloc] initWithCapacity:20];
    
    [mArr addObject:@"Basic"];
    [mArr addObject:@"KeyFrame"];
    [mArr addObject:@"ContextArc"];
    [mArr addObject:@"GraphicsView"];
    [mArr addObject:@"Animation2_1"];
    [mArr addObject:@"Animation3_1"];
    [mArr addObject:@"Animation4_1"];
    [mArr addObject:@"KeyFrameValue"];
    [mArr addObject:@"AnimationPause"];
    [mArr addObject:@"mediaTiming"];
    [mArr addObject:@"OtherLayer"];
    [mArr addObject:@"Replicator"];
    [mArr addObject:@"AppReplicator"];
    [mArr addObject:@"DrawCircle"];
    
    
    
    
    
    
    
    
    
    
    
    [mArr addObject:@""];
    [mArr addObject:@""];
    [mArr addObject:@""];
    [mArr addObject:@""];
    [mArr addObject:@""];
    [mArr addObject:@""];
    
}












@end
