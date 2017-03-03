//
//  AppDelegate.m
//  CopyCarMan
//
//  Created by 木叶林 on 16/9/9.
//  Copyright © 2016年 木叶林. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarViewController.h"
//#import "FBLoginViewController.h"
//#import "PicLobbyViewController.h"
#import "NewLoginViewController.h"
#import <BaiduMapKit/BaiduMapAPI_Map/BMKMapView.h>
#import "AFNetworking.h"


@interface AppDelegate (){
    
    UITableView * _tableView;
    
}



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"gALbR9V4bGw1OciPX1D6eh7kTZQgVTZW"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    // Add the navigation controller's view to the window and display.
    [self.window addSubview:navigationController.view];
    
    MyTabBarViewController * tabBar = [[MyTabBarViewController alloc]init];
    
    NewLoginViewController * newlog = [[NewLoginViewController alloc]init];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:newlog];
    
    NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    
    NSString * str = [user objectForKey:@"Username"];
    
    
    NSLog(@"出来吧，用户名：%@",str);
    
    
    if (str != nil) {
        self.window.rootViewController = tabBar;
        
    }
    
    else
    
    
    self.window.rootViewController = nav;
    

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    
    
    return YES;
}


-(void)AutoLogin{
    
    
}

- (void)onGetNetworkState:(int)iError
{
    if (0 == iError) {
        NSLog(@"联网成功");
    }
    else{
        NSLog(@"onGetNetworkState %d",iError);
    }
    
}

- (void)onGetPermissionState:(int)iError
{
    if (0 == iError) {
        NSLog(@"授权成功");
    }
    else {
        NSLog(@"onGetPermissionState %d",iError);
    }
}







- (void)applicationWillResignActive:(UIApplication *)application {
    //[BMKMapView willBackGround];//当应用即将后台时调用，停止一切调用opengl相关的操作
}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    //[BMKMapView didForeGround];//当应用恢复前台状态时调用，回复地图的渲染和opengl相关的操作
}



- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
