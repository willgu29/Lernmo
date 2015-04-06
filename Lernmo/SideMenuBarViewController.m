//
//  SideMenuBarViewController.m
//  Lernmo
//
//  Created by William Gu on 4/6/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "SideMenuBarViewController.h"
#import "SettingsViewController.h"
#import <RESideMenu/RESideMenu.h>
#import "NotificationViewController.h"
#import "MessagingViewController.h"
#import "MonetaryViewController.h"
@interface SideMenuBarViewController ()

@end

@implementation SideMenuBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)myProfile:(UIButton *)sender
{
    [self.sideMenuViewController hideMenuViewController];
    SettingsViewController *settingsVC = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
    [(UINavigationController *)self.sideMenuViewController.contentViewController pushViewController:settingsVC animated:YES];

}
-(IBAction)monetary:(UIButton *)sender
{
    [self.sideMenuViewController hideMenuViewController];
    MonetaryViewController *monetaryVC = [[MonetaryViewController alloc] initWithNibName:@"MonetaryViewController" bundle:nil];
    [(UINavigationController *)self.sideMenuViewController.contentViewController pushViewController:monetaryVC animated:YES];
}
-(IBAction)notifications:(UIButton *)sender
{
    [self.sideMenuViewController hideMenuViewController];
    NotificationViewController *notifVC = [[NotificationViewController alloc] initWithNibName:@"NotificationViewController" bundle:nil];
    [(UINavigationController *)self.sideMenuViewController.contentViewController pushViewController:notifVC animated:YES];
}
-(IBAction)messages:(UIButton *)sender
{
    [self.sideMenuViewController hideMenuViewController];
    MessagingViewController *messagingVC = [[MessagingViewController alloc] initWithNibName:@"MessagingViewController" bundle:nil];
    [(UINavigationController *)self.sideMenuViewController.contentViewController pushViewController:messagingVC animated:YES];
}
-(IBAction)logout:(UIButton *)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"I'll implement this later" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alertView show];
}


@end
