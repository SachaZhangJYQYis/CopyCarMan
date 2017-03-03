//
//  AppDelegate.h
//  CopyCarMan
//
//  Created by 木叶林 on 16/9/9.
//  Copyright © 2016年 木叶林. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <BaiduMapAPI_Base/BMKMapManager.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    
    UINavigationController *navigationController;
    BMKMapManager* _mapManager;
}

@property (strong, nonatomic) UIWindow *window;


@end

