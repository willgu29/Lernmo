//
//  Router.m
//  TRN
//
//  Created by William Gu on 3/16/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "Router.h"
#import "SearchViewController.h"
#import "ViewUserProfileViewController.h"
#import <RESideMenu/RESideMenu.h>
#import "SideMenuBarViewController.h"
@implementation Router

+(UIViewController *)createMainInterfaceWithNavVC
{
    SearchViewController *searchVC = [[SearchViewController alloc] initWithNibName:@"SearchViewController" bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:searchVC];
    
    SideMenuBarViewController *sideMenu = [[SideMenuBarViewController alloc] initWithNibName:@"SideMenuBarViewController" bundle:nil];
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:navVC leftMenuViewController:sideMenu rightMenuViewController:nil];
                                          
    return sideMenuViewController;
}
+(UIViewController *)createUserProfileVCWithUsername:(NSString *)username
{
    ViewUserProfileViewController *viewVC = [[ViewUserProfileViewController alloc] initWithNibName:@"ViewUserProfileViewController" bundle:nil];
    viewVC.username = username;
    return viewVC;
}

@end
