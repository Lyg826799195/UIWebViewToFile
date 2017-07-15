//
//  AppDelegate.h
//  UIWebViewToFile
//
//  Created by lyg on 2017/7/15.
//  Copyright © 2017年 lyg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

