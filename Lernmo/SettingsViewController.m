//
//  SettingsViewController.m
//  Lernmo
//
//  Created by William Gu on 4/3/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Settings";
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)settings:(UIButton *)sender
{
    
}
-(IBAction)notifications:(UIButton *)sender
{
    
}
@end
