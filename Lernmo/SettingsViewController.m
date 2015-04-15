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
#import "CalendarViewController.h"
@interface SettingsViewController ()

//@property (nonatomic, strong) IBOutlet CKCalendarView *calendarView;
@property (nonatomic, strong) PFObject *teacher;
@property (nonatomic, weak) IBOutlet UITextView *textViewSkillsAdded;
@property (nonatomic, weak) IBOutlet UITextField *textFieldAddSkills;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Edit Profile";
    _teacher = [self fetchTeacher];

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

-(IBAction)segueToCalendar:(UIButton *)sender
{
    CalendarViewController *calendarVC =[[CalendarViewController alloc] initWithNibName:@"CalendarViewController" bundle:nil];
    [self presentViewController:calendarVC animated:YES completion:nil];
}

-(void)setupCalendar
{
    CKCalendarView *calendarView = [CKCalendarView new];
    calendarView.delegate = self;
    calendarView.dataSource = self;
    [self.view addSubview:calendarView];
}

#pragma mark - UITextFieldDelegate

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.text = @"";
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textFieldAddSkills resignFirstResponder];
}


#pragma mark - IBActions

-(IBAction)addSkill:(UIButton *)sender
{
    [_teacher addUniqueObject:_textFieldAddSkills.text forKey:T_SKILLS];
    [_teacher saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {[self fetchUserSkills];}
    }];
    _textFieldAddSkills.text = @"";
}
-(IBAction)removeSkill:(UIButton *)sender
{
    [_teacher removeObject:_textFieldAddSkills.text forKey:T_SKILLS];
    [_teacher saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {[self fetchUserSkills];}
    }];
    _textFieldAddSkills.text = @"";
}

#pragma mark - Helper functions
-(PFObject *)fetchTeacher
{
    PFUser *currentUser = [PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"Teachers"];
    [query whereKey:T_USER_ID equalTo:currentUser.username];
    PFObject *teacher = [query getFirstObject];
    return teacher;
}

-(void)fetchUserSkills
{
    if (_teacher)
    {
        NSArray *skills = _teacher[T_SKILLS];
        NSString * result = [[skills valueForKey:@"description"] componentsJoinedByString:@""];
        _textViewSkillsAdded.text = result;
    }
    else //Create Teacher
    {
        PFObject *newTeacher = [PFObject objectWithClassName:@"Teachers"];
        newTeacher[T_USER_ID] = [PFUser currentUser].username;
        newTeacher[T_SKILLS] = @[];
        [newTeacher saveInBackground];
        _teacher = newTeacher;
    }
}

-(void)displaySkillsForTeacher:(NSArray *)teachers
{
    
}

@end
