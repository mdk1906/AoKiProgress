//
//  AoKiHelperManager.m
//  occ++lua
//
//  Created by mdkmdk on 2020/9/9.
//  Copyright © 2020 mdkmdk. All rights reserved.
//
#define DEF_SINGLETON( __class ) \
+ (__class * __nonnull)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once(&once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

#import "AoKiHelperManager.h"
@interface AoKiHelperManager ()
{
    AoKiProgressView *aokiProgress;
}
@end

@implementation AoKiHelperManager

DEF_SINGLETON(AoKiHelperManager);
- (instancetype)init
{
    self = [super init];
    
    return self;
}
#pragma mark -
-(void)createProgressWithrimImageName:(NSString *)rimImageName fillImageName:(NSString *)fillImageName frameType:(NSString *)frameType{
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    UIViewController *rootViewController = window.rootViewController;
    if ([frameType isEqualToString:@"1"]) {
        aokiProgress = [[AoKiProgressView alloc] initWithFrame:CGRectMake(40, rootViewController.view.bounds.size.height - 50, rootViewController.view.bounds.size.width - 80, 10)];
        UIImage *rimimage = [UIImage imageNamed:rimImageName];
        aokiProgress.rimImage = rimimage;
        aokiProgress.fillImage = [UIImage imageNamed:fillImageName];
        aokiProgress.frameType = frameType;
        [rootViewController.view addSubview:aokiProgress];
    }
    else{
        aokiProgress = [[AoKiProgressView alloc] initWithFrame:CGRectMake(50, 100, 10, rootViewController.view.bounds.size.height - 200)];
        UIImage *rimimage = [UIImage imageNamed:rimImageName];
        aokiProgress.rimImage = rimimage;
        aokiProgress.fillImage = [UIImage imageNamed:fillImageName];
        aokiProgress.frameType = frameType;
        [rootViewController.view addSubview:aokiProgress];
    }
}

-(void)updateProgressWithProgress:(int)progress{
    float prgressFloat = progress/100.00;
    aokiProgress.progressValue = prgressFloat;
}

-(void)shutdownProgress{
    [aokiProgress removeFromSuperview];
}
@end
