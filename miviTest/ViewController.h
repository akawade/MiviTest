//
//  ViewController.h
//  miviTest
//
//  Created by Avinash Kawade on 06/05/18.
//  Copyright © 2018 Avinash Kawade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic)IBOutlet UITextField *userName;
@property (strong, nonatomic)IBOutlet UITextField *passCode;
@property (strong, nonatomic)IBOutlet UIButton *loginBtn;

-(IBAction)loginClicked:(id)sender;

@end


