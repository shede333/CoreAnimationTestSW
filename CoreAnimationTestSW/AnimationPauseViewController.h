//
//  AnimationPauseViewController.h
//  AnimationPause
//
//  Created by gamy on 12-1-5.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//extern NSString * const swTest1ExCon;
//NSString * const swTest2Con;
//NSString * swTest3;
//static NSString * swTest4Sta;
// NSString static* swTest4Sta2;

@interface AnimationPauseViewController : UIViewController {
    
    UIImageView *soccer;
    BOOL isPause;
    UIButton *controlButton;
    CFTimeInterval time;
}
@property (nonatomic, retain) IBOutlet UIImageView *soccer;
- (IBAction)clickControlButton:(id)sender;
@property (nonatomic, retain) IBOutlet UIButton *controlButton;

@end
