//
//  AppDelegate.h
//  miviTest
//
//  Created by Avinash Kawade on 06/05/18.
//  Copyright © 2018 Avinash Kawade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

