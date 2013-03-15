//
//  DCDViewController.m
//  MoofDemo
//
//  Created by Green2, David on 3/15/13.
//  Copyright (c) 2013 digital-worlds. All rights reserved.
//

#import "DCDViewController.h"
#import "../../MoofKit/MOOFDialogContainerView.h"
#import "../../MoofKit/MOOFImageProvider.h"

@interface DCDViewController ()
@property (nonatomic, strong) MOOFDialogContainerView *dialog;
@end

@implementation DCDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.dialog = [[MOOFDialogContainerView alloc] initWithFrame:CGRectInset(self.view.bounds, 16.0, 16.0)];
	[self.view addSubview:self.dialog];
	[self.view setBackgroundColor:[MOOFImageProvider greyBackgroundPatternColor]];
	UIImage *clarusImage = [MOOFImageProvider clarusImage];
	UIImageView *clarusView = [[UIImageView alloc] initWithImage:clarusImage];
	clarusView.frame = CGRectMake(8.0, 8.0, clarusImage.size.width, clarusImage.size.height);
	clarusView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
	[self.dialog.contentView addSubview:clarusView];
	UILabel *clarusLabel = [[UILabel alloc] initWithFrame:CGRectMake(8.0, 16.0 + clarusImage.size.height, 96.0, 96.0)];
	clarusLabel.numberOfLines = 0;
	clarusLabel.lineBreakMode = NSLineBreakByWordWrapping;
	clarusLabel.text = @"Clarus says\n\"Moof!\"";
	[clarusLabel setFont:[UIFont fontWithName:@"Chicago" size:22.0]];
	clarusLabel.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
	[self.dialog.contentView addSubview:clarusLabel];
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
