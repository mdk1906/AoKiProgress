//
//  AoKiProgressView.m
//  occ++lua
//
//  Created by mdkmdk on 2020/9/9.
//  Copyright © 2020 mdkmdk. All rights reserved.
//

#import "AoKiProgressView.h"

@interface AoKiProgressView ()
/**
 进度条 progressView
 */
@property (nonatomic ,strong) UIImageView *progressView;

/**
 *  progressView Rect
 */
@property (nonatomic) CGRect rect_progressView;


@end
@implementation AoKiProgressView

#pragma mark -懒加载
- (UIImageView *)progressView
{
    if (!_progressView) {
        _progressView = [UIImageView new];
         [self addSubview:self.progressView];
    }
    return _progressView;
}

#pragma mark -  initWithFrame

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

#pragma mark - Setter

-(void)setRimImage:(UIImage *)rimImage{
    _rimImage = rimImage;
    
    self.image = _rimImage;
}


-(void)setFillImage:(UIImage *)fillImage{
    _fillImage = fillImage;
    
    self.progressView.image = fillImage;
}

-(void)setFrameType:(NSString *)frameType{
    _frameType = frameType;
    self.rect_progressView = CGRectZero;
    if ([frameType isEqualToString:@"1"]) {
        _rect_progressView.size.height = self.frame.size.height;
    }
    else{
        _rect_progressView.size.width = self.frame.size.width;
    }
    self.progressView.frame = self.rect_progressView;

}

- (void)setProgressValue:(float)progressValue
{
    _progressValue = progressValue;
    if ([_frameType isEqualToString:@"1"]) {
        CGFloat progressWidth = self.bounds.size.width * _progressValue;
        
        progressWidth = MIN(progressWidth, self.bounds.size.width);
        
        _rect_progressView.size.width = progressWidth;
        
        
        CGFloat maxValue = self.bounds.size.width;
        
        double durationValue = (progressWidth/2.0) / maxValue + .5;
        [UIView animateWithDuration:durationValue animations:^{
            
            self.progressView.frame = self->_rect_progressView;
        }];

    }
    else{
        CGFloat progressHeight = self.bounds.size.height * _progressValue;
        progressHeight = MIN(progressHeight, self.bounds.size.height);
        
        _rect_progressView.size.height = progressHeight;
        
        
        CGFloat maxValue = self.bounds.size.height;
        
        double durationValue = (progressHeight/2.0) / maxValue + .5;
        [UIView animateWithDuration:durationValue animations:^{
            
            self.progressView.frame = self->_rect_progressView;
        }];
        
    }
    
}
@end
