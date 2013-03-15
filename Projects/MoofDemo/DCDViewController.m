//
//  DCDViewController.m
//  MoofDemo
//
//  Created by Green2, David on 3/15/13.
//  Copyright (c) 2013 digital-worlds. All rights reserved.
//

#import "DCDViewController.h"
#import "../../MoofKit/MOOFDialogContainerView.h"

@interface DCDViewController ()
@property (nonatomic, strong) MOOFDialogContainerView *dialog;
@end

@implementation DCDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.dialog = [[MOOFDialogContainerView alloc] initWithFrame:CGRectInset(self.view.bounds, 16.0, 16.0)];
	[self.view addSubview:self.dialog];
	[self animateSubview];
}

-(void)animateSubview {
	[UIView animateWithDuration:1.0
						  delay:2.0
						options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
						 CGRect frame = CGRectInset(self.view.bounds, 48.0, 64.0);
						 self.dialog.frame = frame;
					 } completion:^(BOOL finished) {
						 [UIView animateWithDuration:1.0
											   delay:2.0
											 options:UIViewAnimationOptionCurveEaseInOut
										  animations:^{
											  CGRect frame = CGRectMake(24.0, 24.0, 128.0, 192.0);
											  self.dialog.frame = frame;
										  } completion:^(BOOL finished) {
											  [UIView animateWithDuration:1.0
																	delay:2.0
																  options:UIViewAnimationOptionCurveEaseInOut
															   animations:^{
																   CGRect frame = CGRectMake(self.view.bounds.size.width - 152.0, self.view.bounds.size.height - 216.0, 128.0, 192.0);
																   self.dialog.frame = frame;
															   } completion:^(BOOL finished) {
																   [UIView animateWithDuration:1.0
																						 delay:2.0
																					   options:UIViewAnimationOptionCurveEaseInOut
																					animations:^{
																						CGRect frame = CGRectInset(self.view.bounds, 16.0, 16.0);
																						self.dialog.frame = frame;
																					} completion:^(BOOL finished) {
																						[self animateSubview];
																					}];
															   }];
										  }];
					 }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
