//
//  ViewController.m
//  miviTest
//
//  Created by Avinash Kawade on 06/05/18.
//  Copyright © 2018 Avinash Kawade. All rights reserved.
//

#import "ViewController.h"
#import "SplashScreen.h"

@interface ViewController ()

@property (strong, nonatomic)SplashScreen * splashViewController;
@end

@implementation ViewController
UIView *splashScreenView;
@synthesize userName,passCode,loginBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.passCode.secureTextEntry = YES;
    self.passCode.layer.borderWidth = 2;
    self.passCode.layer.cornerRadius = 4;
    self.passCode.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.userName.layer.borderWidth = 2;
    self.userName.layer.cornerRadius = 4;
    self.userName.layer.borderColor = [[UIColor blackColor] CGColor];
    
    self.loginBtn.layer.borderWidth = 2;
    self.loginBtn.layer.cornerRadius = 4;
    self.loginBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginClicked:(id)sender{
    NSString *strUser = self.userName.text;
    bool isValid = [self validateEmailAddress:strUser];
    if(isValid){
        
        splashScreenView= [[UIView alloc]initWithFrame:self.view.frame]; //initWithNibName:@"SplashScreen" bundle:nil];
        splashScreenView.backgroundColor = [UIColor whiteColor];
        UILabel *greetLabel = [[UILabel alloc]init];
        [greetLabel setFont:[UIFont boldSystemFontOfSize:15]];
        greetLabel.textColor = [UIColor blackColor];
        greetLabel.text = @"Welcome to Mivi...";
        greetLabel.bounds = CGRectMake(20, 100, 100, 50);
        greetLabel.backgroundColor = [UIColor redColor];
       // greetLabel.center = CGPint self.splashViewController.view.frame.size.height/2,100,40);
        [self.splashViewController.view  addSubview:greetLabel];
        [self.view addSubview:splashScreenView];
        
        [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(onSlashScreenDone) userInfo:nil repeats:NO];
        
    }else{
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"InValid Credential"
                                     message:@"Please enter valid login details.."
                                     preferredStyle:UIAlertControllerStyleAlert];
        
       
        
        UIAlertAction* okButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        //Handle your yes please button action here
                                    }];
               
        
        [alert addAction:okButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}


- (BOOL) validateEmailAddress:(NSString*) emailAddress {
    
    if([emailAddress length]==0){
        return NO;
    }
    
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailAddress options:0 range:NSMakeRange(0, [emailAddress length])];
    
//    NSLog(@"%i", regExMatches);
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
    
}


-(void)onSlashScreenDone{
    [splashScreenView removeFromSuperview];
   // [self.view.window makeKeyAndVisible];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"CollectionController"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
}
@end
