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
#import "MyClassesViewController.h"
#import "LoginViewController.h"

#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

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

-(IBAction)myClasses:(UIButton *)sender
{
    [self.sideMenuViewController hideMenuViewController];
    MyClassesViewController *myClassesVC = [[MyClassesViewController alloc] initWithNibName:@"MyClassesViewController" bundle:nil];
    [(UINavigationController *)self.sideMenuViewController.contentViewController pushViewController:myClassesVC animated:YES];
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
    [self.sideMenuViewController hideMenuViewController];
    [FBSDKAccessToken setCurrentAccessToken:nil];
    [PFUser logOutInBackgroundWithBlock:^(NSError *error) {
        [self.sideMenuViewController.contentViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        
    }];

}


@end
