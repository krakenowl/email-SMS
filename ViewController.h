//
//  ViewController.h
//  email&SMSApp
//
//  Created by Ivan Cantarino on 09/09/13.
//  Copyright (c) 2013 Ivan Cantarino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

//CONNECTIONS CREATED

- (IBAction)sendEmail:(id)sender;

- (IBAction)sendSMS:(id)sender;

@end
