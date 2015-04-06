//
//  MessagingViewController.m
//  Lernmo
//
//  Created by William Gu on 4/6/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "MessagingViewController.h"

@interface MessagingViewController ()

@end

@implementation MessagingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Messaging";
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
