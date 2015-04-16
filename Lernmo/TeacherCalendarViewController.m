//
//  TeacherCalendarViewController.m
//  Lernmo
//
//  Created by William Gu on 4/15/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "TeacherCalendarViewController.h"

@interface TeacherCalendarViewController ()

@end

@implementation TeacherCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)back:(UIButton *)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
