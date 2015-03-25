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
    
    
    CGFloat xCenter = self.view.center.x;
    
    
    UIButton *btnCustom = [[UIButton alloc] init];
    [btnCustom setTitle:@"Custom Engagement" forState:UIControlStateNormal];
    [btnCustom.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [btnCustom addTarget:self action:@selector(doChat) forControlEvents:UIControlEventTouchUpInside];
    [btnCustom sizeToFit];
    
    btnCustom.center = CGPointMake(xCenter, 100);

    [self.view addSubview:btnCustom];
    
    
    UIButton *btnCBN = [[UIButton alloc] init];
    [btnCBN setTitle:@"Create a CBN" forState:UIControlStateNormal];
    [btnCBN.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [btnCBN addTarget:self action:@selector(doCbn) forControlEvents:UIControlEventTouchUpInside];
    [btnCBN sizeToFit];
    
    btnCBN.center = CGPointMake(xCenter, 200);
    
    [self.view addSubview:btnCBN];
    
    UIButton *btnWebLead = [[UIButton alloc] init];
    [btnWebLead setTitle:@"Create a WebLead" forState:UIControlStateNormal];
    [btnWebLead.titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [btnWebLead addTarget:self action:@selector(doWebLead) forControlEvents:UIControlEventTouchUpInside];
    [btnWebLead sizeToFit];
    
    btnWebLead.center = CGPointMake(xCenter, 300);
    
    [self.view addSubview:btnWebLead];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [Vivocha setBlockSideButton:YES];
    [Vivocha hideChatButton];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [Vivocha setBlockSideButton:NO];
    [Vivocha showChatButton];
}

- (void) doChat{
    
    if ([Vivocha contact]) {
        [[Vivocha contact] showView:YES];
    }
    else{
        [Vivocha createChatWithDataCollection:[Vivocha getDataCollection] andCompletionBlock:^(VivochaContact *contact) {
            
            if (contact) {
                [contact connect];
                [contact showView:YES];
            }
            else{
                //Aww, snap! Show an alert to notify the failure
            }
            
        }];
    }
    
}


- (void) doCbn{
    [Vivocha createCallBackNowWithDataCollection:[Vivocha getDataCollection] andPhoneNumber:@"+123456789" andCompletionBlock:^(VivochaContact *contact) {
        if (contact) {
            //call back now created!
        }
        else{
            //there was an error creating the cbn!
        }
    }];
    
}

- (void) doWebLead{
    
    [Vivocha createWebLeadWithDataCollection:[Vivocha getDataCollection] andEmail:@"email@example.com" andCompletionBlock:^(VivochaContact *contact) {
        if (contact) {
            //WebLead created!
        }
        else{
            //There was an error creating the weblead!
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
