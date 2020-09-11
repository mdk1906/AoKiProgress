//
//  ViewController.m
//  AoKiProgress
//
//  Created by mdkmdk on 2020/9/11.
//  Copyright © 2020 mdkmdk. All rights reserved.
//

#import "ViewController.h"
#import "AoKiProgressView/AoKiHelperManager.h"
@interface ViewController ()
{
    int progressnum;//进度0-100
}

@property (nonatomic ,strong)NSTimer *progresstime;//进度计时器
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createProgress];
}

#pragma mark - 懒加载
-(NSTimer *)progresstime{
    if (!_progresstime) {
        _progresstime = [[NSTimer alloc] init];
    }
    return _progresstime;
}

#pragma mark -进度条
-(void)createProgress{
    [[AoKiHelperManager sharedInstance] createProgressWithrimImageName:@"progress_bg.png" fillImageName:@"progress_acr_bg.png" frameType:@"1"];
}

- (IBAction)startProgress:(id)sender {
    self.progresstime = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

- (IBAction)removeProgress:(id)sender {
    [[AoKiHelperManager sharedInstance] shutdownProgress];
}

-(void)timerFired{
    progressnum += 1;
    [[AoKiHelperManager sharedInstance]updateProgressWithProgress:progressnum];
    if (progressnum >=100) {
        [self.progresstime invalidate];
    }
}

@end
