//
//  ViewController.m
//  DrawCircleProgress
//
//  Created by shlity on 16/7/13.
//  Copyright © 2016年 Moresing Inc. All rights reserved.
//

#import "ViewController.h"
#import "DrawCircleProgressButton.h"

@interface ViewController ()

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    
    DrawCircleProgressButton *drawCircleView = [[DrawCircleProgressButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 55, 30, 40, 40)];
    drawCircleView.lineWidth = 2;
    [drawCircleView setTitle:@"跳过" forState:UIControlStateNormal];
    [drawCircleView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    drawCircleView.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [drawCircleView addTarget:self action:@selector(removeProgress) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  progress 完成时候的回调
     */
    __weak ViewController *weakSelf = self;
    [drawCircleView startAnimationDuration:5 withBlock:^{
        [weakSelf removeProgress];
    }];
    
    [self.view addSubview:drawCircleView];
}

- (void)removeProgress
{
    self.imageView.transform = CGAffineTransformMakeScale(1, 1);
    self.imageView.alpha = 1;
    
    [UIView animateWithDuration:0.7 animations:^{
        self.imageView.alpha = 0.05;
        self.imageView.transform = CGAffineTransformMakeScale(5, 5);
    } completion:^(BOOL finished) {
        
        [self.imageView removeFromSuperview];
        
    }];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _imageView.image = [UIImage imageNamed:@"launch_image.jpg"];
    }
    return _imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
