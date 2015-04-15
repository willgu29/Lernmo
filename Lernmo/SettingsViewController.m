//
//  SettingsViewController.m
//  Lernmo
//
//  Created by William Gu on 4/3/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "SettingsViewController.h"
#import <Parse/Parse.h>
#import "NSUserDefaultValues.h"
#import "TeacherParseValues.h"
@interface SettingsViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textViewSkillsAdded;
@property (nonatomic, weak) IBOutlet UITextField *textFieldAddSkills;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Edit Profile";
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    [self fetchUserSkills];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = @"";
}


#pragma mark - IBActions

-(IBAction)addSkill:(UIButton *)sender
{
    PFObject *teacher = [self fetchUser];
    [teacher addUniqueObject:_textFieldAddSkills.text forKey:T_SKILLS];
    [teacher saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {[self fetchUserSkills];}
    }];
    _textFieldAddSkills.text = @"";
}
-(IBAction)removeSkill:(UIButton *)sender
{
    PFObject *teacher = [self fetchUser];
    [teacher removeObject:_textFieldAddSkills.text forKey:T_SKILLS];
    [teacher saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {[self fetchUserSkills];}
    }];
    _textFieldAddSkills.text = @"";
}

#pragma mark - Helper functions
-(PFObject *)fetchUser
{
    NSString *userID = [[NSUserDefaults standardUserDefaults] objectForKey:N_FB_TOKEN];
    PFQuery *query = [PFQuery queryWithClassName:@"Teachers"];
    [query whereKey:T_USER_ID equalTo:userID];
    PFObject *teacher = [query getFirstObject];
    return teacher;
}

-(void)fetchUserSkills
{
    PFObject *teacher = [self fetchUser];
    if (teacher)
    {
        NSArray *skills = teacher[T_SKILLS];
        NSString * result = [[skills valueForKey:@"description"] componentsJoinedByString:@""];
        _textViewSkillsAdded.text = result;
    }
    else //Create Teacher
    {
        PFObject *newTeacher = [PFObject objectWithClassName:@"Teachers"];
        newTeacher[T_USER_ID] = [[NSUserDefaults standardUserDefaults] objectForKey:N_FB_TOKEN];
        newTeacher[T_SKILLS] = @[];
        [newTeacher saveInBackground];
    }
}

-(void)displaySkillsForTeacher:(NSArray *)teachers
{
    
}

@end
