//
//  LocationViewController.m
//  Lernmo
//
//  Created by William Gu on 4/3/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Select Location";
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)locationChosen:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self presentSuccessAlertView];
}

#pragma mark - Helper functions
-(void)presentSuccessAlertView
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Your session has been booked and you'll be notified an hour before the lesson begins!" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alertView show];
}

@end
