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

@end

@implementation DCDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	MOOFDialogContainerView *dialog = [[MOOFDialogContainerView alloc] initWithFrame:CGRectInset(self.view.bounds, 16.0, 16.0)];
	[self.view addSubview:dialog];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
