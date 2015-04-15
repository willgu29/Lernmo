//
//  CalendarViewController.m
//  Lernmo
//
//  Created by William Gu on 4/3/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "CalendarViewController.h"
#import "LocationViewController.h"
@interface CalendarViewController ()

@end

@implementation CalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Select Availability";
    [self setupCalendar];
}

-(void)setupCalendar
{
    CKCalendarView *calendar = [[CKCalendarView alloc] init];
    calendar.delegate = self;
    calendar.dataSource = self;
    [self.view addSubview:calendar];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)selectTime:(UIButton *)sender
{
    LocationViewController *locationVC = [[LocationViewController alloc] initWithNibName:@"LocationViewController" bundle:nil];
    [self.navigationController pushViewController:locationVC animated:YES];
}
@end
