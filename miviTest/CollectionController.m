//
//  CollectionController.m
//  miviTest
//
//  Created by Avinash Kawade on 06/05/18.
//  Copyright © 2018 Avinash Kawade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionController.h"

@interface CollectionController ()

@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Collection" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSDictionary *userData = [(NSDictionary*)json objectForKey:@"data"];
    NSDictionary *subscriptionData  = [[(NSDictionary*)json objectForKey:@"included"] objectAtIndex:1];
    NSDictionary *productData = [[(NSDictionary*)json objectForKey:@"included"] objectAtIndex:2];

//    NSLog(@"User Collection->%@",userData);
//    NSLog(@"includedData ->%@",subscriptionData);
//    NSLog(@"productData ->%@",productData);

    
    UILabel *newName = [[UILabel alloc]init];
    newName.frame = CGRectMake(10, 40, 200, 20);
    [newName setFont:[UIFont boldSystemFontOfSize:15]];
    newName.textColor = [UIColor blackColor];
    newName.lineBreakMode = YES;
    NSString *userName = [NSString stringWithFormat:@"%@  %@ %@",[[userData objectForKey:@"attributes"] objectForKey:@"title"],[[userData objectForKey:@"attributes"] objectForKey:@"first-name"],[[userData objectForKey:@"attributes"] objectForKey:@"last-name"]];
    newName.text = userName;
    newName.backgroundColor = [UIColor clearColor];

    [self.view addSubview:newName];
    
    
    UILabel *subScription = [[UILabel alloc]init];
    subScription.frame = CGRectMake(10, newName.frame.origin.y+newName.frame.size.height+20, 200, 20);
    [subScription setFont:[UIFont boldSystemFontOfSize:15]];
    subScription.textColor = [UIColor blackColor];
    subScription.lineBreakMode = YES;
    NSDictionary *subScriptionInfo = [subscriptionData objectForKey:@"attributes"];
    subScription.text = [NSString stringWithFormat:@"Data Balance: %@",[subScriptionInfo objectForKey:@"included-data-balance"]];
    subScription.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:subScription];

    
}

@end
