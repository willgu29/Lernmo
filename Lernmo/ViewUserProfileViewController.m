//
//  ViewUserProfileViewController.m
//  TRN
//
//  Created by William Gu on 3/22/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "ViewUserProfileViewController.h"
#import "CalendarViewController.h"
#import "MessagingViewController.h"

@interface ViewUserProfileViewController ()

@end

@implementation ViewUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Username's Profile";
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)messageTeacher:(UIButton *)sender
{
    MessagingViewController *messageVC = [[MessagingViewController alloc] initWithNibName:@"MessagingViewController" bundle:nil];
    [self.navigationController pushViewController:messageVC animated:YES];
}

-(IBAction)findAvailability:(UIButton *)sender
{
    CalendarViewController *calendarVC = [[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
    [self.navigationController pushViewController:calendarVC animated:YES];
}



@end
