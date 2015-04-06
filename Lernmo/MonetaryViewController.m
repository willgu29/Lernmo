//
//  MonetaryViewController.m
//  Lernmo
//
//  Created by William Gu on 4/6/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "MonetaryViewController.h"

@interface MonetaryViewController ()

@end

@implementation MonetaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Monetary Transactions";
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
