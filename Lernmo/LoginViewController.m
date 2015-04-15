//
//  LoginViewController.m
//  Lernmo
//
//  Created by William Gu on 4/3/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "LoginViewController.h"
#import "Router.h"
#import "Location.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "NSUserDefaultValues.h"
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "ParseUserValues.h"
#import <Parse/Parse.h>
#import "SetupBankingViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
-(void)viewWillAppear:(BOOL)animated{
    if ([PFUser currentUser]) {
        [self segueToMainInterface];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)login:(UIButton *)sender
{
    [PFFacebookUtils logInInBackgroundWithReadPermissions:[self getFBPermissions] block:^(PFUser *user, NSError *error) {
        if (!user) {
            [self displayPleaseLoginAlert];
        } else if (user.isNew) {
            [self getAndSaveFBDataForParseUserInCallback];
            [self segueToSetupViewController];
        } else {
            [self segueToMainInterface];
        }
    }];

}
-(void)segueToMainInterface
{
    UIViewController *mainVC = [Router createMainInterfaceWithNavVC];
    [self presentViewController:mainVC animated:YES completion:nil];
}
-(void)getAndSaveFBDataForParseUserInCallback
{
    [self saveFBDataToParseUser:[FBSDKProfile currentProfile]];

}
-(NSArray *)getFBPermissions
{
    return @[@"public_profile", @"email"];//, @"user_friends", @"user_likes", @"user_birthday", @"user_interests"];
}
-(void)saveFBDataToParseUser:(FBSDKProfile *)userInfo
{
    PFUser *currentUser = [PFUser currentUser];
    currentUser[U_FB_ID] = userInfo.userID;
    currentUser[U_DEVICE_TOKEN] = [[NSUserDefaults standardUserDefaults] stringForKey:N_DEVICE_TOKEN_STRING];
    currentUser[U_EMAIL] = [userInfo valueForKey:@"email"];
    currentUser[U_FIRST_NAME] = userInfo.firstName;
    currentUser[U_LAST_NAME] = userInfo.lastName;
    currentUser[U_FULL_NAME] = userInfo.name;
    currentUser[U_WARNINGS_GIVEN] = [NSNumber numberWithInt:0];
    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLocation:[Location shared].userLocation];
    currentUser[U_LOCATION_COORDINATE] = geoPoint;
    [currentUser saveInBackground];
}
-(void)displayPleaseLoginAlert
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Uh oh.." message:@"Please login through facebook to continue!" delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil];
    [alertView show];
}
-(void)segueToSetupViewController
{
    SetupBankingViewController *setupVC = [[SetupBankingViewController alloc] initWithNibName:@"SetupBankingViewController" bundle:nil];
    [self presentViewController:setupVC animated:YES completion:nil];
}


@end
