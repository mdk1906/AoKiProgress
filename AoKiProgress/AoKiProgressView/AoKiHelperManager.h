//
//  AoKiHelperManager.h
//  occ++lua
//
//  Created by mdkmdk on 2020/9/9.
//  Copyright © 2020 mdkmdk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AoKiProgressView.h"
NS_ASSUME_NONNULL_BEGIN

@interface AoKiHelperManager : NSObject
+ (AoKiHelperManager * __nonnull)sharedInstance;
/**
 创建进度条
@param  rimImageName 底部边框图片名称
@param  fillImageName 填充图片名称
@param  frameType 1:底部 2:左边
 */
-(void)createProgressWithrimImageName:(NSString *)rimImageName fillImageName:(NSString *)fillImageName frameType:(NSString *)frameType;

/**
 更新进度
 @param progress 当前进度
 */
-(void)updateProgressWithProgress:(int)progress;

/**
 关闭进度条
 */
-(void)shutdownProgress;
@end

NS_ASSUME_NONNULL_END
