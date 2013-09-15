//
//  ViewController.m
//  email&SMSApp
//
//  Created by Ivan Cantarino on 09/09/13.
//  Copyright (c) 2013 Ivan Cantarino. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//EMAIL BUTTON HERE

- (IBAction)sendEmail:(id)sender {
    
    NSString *emailTitle = @"Email Test";
    NSString *messageBody = @"Feedback Received";
    NSArray *toRecipents = [NSArray arrayWithObject:@"emaildestination@gmail.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    [self presentViewController:mc animated:YES completion:NULL];
    

    
}


//VOID COMMAND

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
}

//SMS BUTTON HERE AND IT'S IMPLEMENTATION

- (IBAction)sendSMS:(id)sender {
    
    MFMessageComposeViewController *sms = [[MFMessageComposeViewController alloc]init];
    [sms setMessageComposeDelegate:self];
    if ([MFMessageComposeViewController canSendText]) {
        [sms setRecipients:[NSArray arrayWithObject:nil]];
        [sms setBody:@""];
        [self presentViewController:sms animated:YES completion:NULL];
    }else {
        NSLog(@"Error");
    }

}

//VOID COMMAND

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end

//DON'T FORGET TO DOWNLOAD THE MESSAGE UI FRAMEWORK, ADD THE BUTTONS TO THE EDITOR (HEADER) WITH THE SAME NAMES


