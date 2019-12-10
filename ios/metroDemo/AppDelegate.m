/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTBridge+Private.h>
#import "RCTBridge.h"

@implementation AppDelegate
{
  RCTBridge *bridge;
  UINavigationController *rootViewController;
  UIViewController *mainViewController;
  }

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"platform.ios" withExtension:@"bundle"];
   bridge = [[RCTBridge alloc] initWithBundleURL:jsCodeLocation
                                  moduleProvider:nil
                                   launchOptions:launchOptions];
  
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  mainViewController = [UIViewController new];
  mainViewController.view.backgroundColor = [UIColor whiteColor];
  rootViewController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
  mainViewController.edgesForExtendedLayout = UIRectEdgeNone;
  
  UIButton* buz1 = [UIButton buttonWithType:UIButtonTypeCustom];
  [buz1 setTitle:@"page1" forState:UIControlStateNormal];
  [buz1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
  
  UIButton* buz2 = [UIButton buttonWithType:UIButtonTypeCustom];
  [buz2 setTitle:@"page2" forState:UIControlStateNormal];
  [buz2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

  UIButton* buz3 = [UIButton buttonWithType:UIButtonTypeCustom];
  [buz3 setTitle:@"page3" forState:UIControlStateNormal];
  [buz3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


  [buz1 setFrame:CGRectMake(100, 100, 80, 40)];
  [buz2 setFrame:CGRectMake(100, 200, 80, 40)];
  [buz3 setFrame:CGRectMake(100, 300, 80, 40)];

  [mainViewController.view addSubview:buz1];
  [mainViewController.view addSubview:buz2];
  [mainViewController.view addSubview:buz3];

  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  [buz1 addTarget:self action:@selector(goBuz1:) forControlEvents:UIControlEventTouchUpInside];
  [buz2 addTarget:self action:@selector(goBuz2:) forControlEvents:UIControlEventTouchUpInside];
  [buz3 addTarget:self action:@selector(goBuz3:) forControlEvents:UIControlEventTouchUpInside];

  return YES;
}


- (void)goBuz1:(UIButton *)button{
  [self gotoBuzWithModuleName:@"reactnative_multibundler" bundleName:@"index.ios"];
}

- (void)goBuz2:(UIButton *)button{
  [self gotoBuzWithModuleName:@"reactnative_multibundler2" bundleName:@"index2.ios"];
}

- (void)goBuz3:(UIButton *)button{
  [self gotoBuzWithModuleName:@"reactnative_multibundler3" bundleName:@"index3.ios"];
}

- (void) gotoBuzWithModuleName:(NSString*)moduleName bundleName:(NSString*)bundleName{
 
  NSURL *jsCodeLocationBuz = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];

  NSError *error = nil;
  NSData *sourceBuz = [NSData dataWithContentsOfFile:jsCodeLocationBuz.path
                                             options:NSDataReadingMappedIfSafe
                                               error:&error];
  [bridge.batchedBridge executeSourceCode:sourceBuz sync:NO];
  RCTRootView* view = [[RCTRootView alloc] initWithBridge:bridge moduleName:moduleName initialProperties:nil];
  UIViewController* controller = [UIViewController new];
  [controller setView:view];
  [mainViewController.navigationController pushViewController:controller animated:YES];
}



- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
  return  [NSURL URLWithString:@""];
}

@end
