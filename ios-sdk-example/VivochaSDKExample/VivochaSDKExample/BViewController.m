//
//  BViewController.m
//  VivochaSDKExample
//
//  Created by Michael Siddi on 04/04/14.
//  Copyright (c) 2014 Vivocha Inc. All rights reserved.
//

#import "BViewController.h"
#import <VivochaSDK/VivochaSDK.h>

@interface BViewController ()

@end

@implementation BViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
    
    UIButton *btnVideo = [[UIButton alloc] init];
    [btnVideo setTitle:@"Start a Video Call" forState:UIControlStateNormal];
    [btnVideo.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    
    
    [btnVideo addTarget:self action:@selector(doStartVideo) forControlEvents:UIControlEventTouchUpInside];
    
    [btnVideo sizeToFit];
    [self.view addSubview:btnVideo];
    
    btnVideo.center = self.view.center;
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void) doStartVideo{
    [Vivocha createVideoChatWithDataCollection:nil andCompletionBlock:^(VivochaContact *contact)  {
        if(contact){
            NSLog(@"Video Chat created...");
        }
        else{
            NSLog(@"There was an error creating the Video Chat");
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
