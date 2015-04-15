//
//  SetupBankingViewController.m
//  Lernmo
//
//  Created by William Gu on 4/13/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "SetupBankingViewController.h"
#import "Router.h"

@interface SetupBankingViewController ()

@end

@implementation SetupBankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)segueToMain:(UIButton *)sender
{
    UIViewController *mainVC = [Router createMainInterfaceWithNavVC];
    [self presentViewController:mainVC animated:YES completion:nil];
}
@end
