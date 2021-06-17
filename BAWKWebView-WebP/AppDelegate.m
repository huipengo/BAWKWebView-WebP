//
//  AppDelegate.m
//  BAWKWebView-WebP
//
//  Created by 海洋唐 on 2017/8/2.
//  Copyright © 2017年 boai. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <SDWebImageWebPCoder/SDImageWebPCoder.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
    /// 添加Webp格式解码
    [SDImageCodersManager.sharedManager addCoder:[SDImageWebPCoder sharedCoder]];
    [SDWebImageDownloader.sharedDownloader setValue:@"image/webp,image/*,*/*;q=0.8" forHTTPHeaderField:@"Accept"];
    
    return YES;
}

@end
