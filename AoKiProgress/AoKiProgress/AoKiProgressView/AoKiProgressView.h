//
//  AoKiProgressView.h
//  occ++lua
//
//  Created by mdkmdk on 2020/9/9.
//  Copyright © 2020 mdkmdk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AoKiProgressView : UIImageView

/**
 *  进度值
 */
@property (nonatomic) float progressValue;

/**
 边框图片
 */
@property (nonatomic ,strong)UIImage *rimImage;

/**
 填充图片
 */
@property (nonatomic ,strong)UIImage *fillImage;

/**
 frame类型 frameType 1:底部 2:左边
 */
@property (nonatomic, strong) NSString *frameType;



@end

NS_ASSUME_NONNULL_END
