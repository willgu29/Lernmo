//
//  MyClassesViewController.m
//  Lernmo
//
//  Created by William Gu on 4/6/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "MyClassesViewController.h"
#import "ClassInViewController.h"
@interface MyClassesViewController ()

@end

@implementation MyClassesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Classes";
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)classInProgress:(UIButton *)sender
{
    ClassInViewController *classInVC = [[ClassInViewController alloc] initWithNibName:@"ClassInViewController" bundle:nil];
    [self.navigationController pushViewController:classInVC animated:YES];
}


@end
