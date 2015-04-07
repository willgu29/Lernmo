//
//  ClassInViewController.m
//  Lernmo
//
//  Created by William Gu on 4/6/15.
//  Copyright (c) 2015 William Gu. All rights reserved.
//

#import "ClassInViewController.h"

@interface ClassInViewController ()
{
    int currMinute;
    int currSeconds;
}

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) IBOutlet UILabel *timerProgress;

@end

@implementation ClassInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupTimer];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self startTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)teacherCheckIn:(UIButton *)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Awesome!" message:@"You've checked in and that's cool." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alertView show];
}
-(IBAction)studentCheckIn:(UIButton *)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Nice!" message:@"You've checked in, get ready to learn!" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alertView show];
}
-(IBAction)help:(UIButton *)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Will implement later with specifics you give me" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alertView show];
}


#pragma mark - Timer

-(void)setupTimer
{
    _timerProgress.textColor=[UIColor redColor];
    [_timerProgress setText:@"Time : 3:00"];
    currMinute=3;
    currSeconds=00;
}

-(void)startTimer
{
    _timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
    
}
-(void)timerFired
{
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=59;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1)
            [_timerProgress setText:[NSString stringWithFormat:@"%@%d%@%02d",@"Time : ",currMinute,@":",currSeconds]];
    }
    else
    {
        [_timer invalidate];
    }
}
@end
