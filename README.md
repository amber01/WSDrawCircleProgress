# WSDrawCircleProgress



## Overview

**WSDrawCircleProgress**, 根据UIBezierPath和CAShapeLayer自定义倒计时进度条，适用于app启动的时候设置一个倒计时关闭启动页面。可以设置进度条颜色，填充颜色，进度条宽度以及点击事件等。

#### 截图概述

![Mou icon](http://ww1.sinaimg.cn/mw690/63f96e20gw1f5sf589qcqg208u0g9agx.gif)

#### 公共方法
```objc
//set track color
@property (nonatomic,strong)UIColor    *trackColor;

//set progress color
@property (nonatomic,strong)UIColor    *progressColor;

//set track background color
@property (nonatomic,strong)UIColor    *fillColor;

//set progress line width
@property (nonatomic,assign)CGFloat    lineWidth;

//set progress duration
@property (nonatomic,assign)CGFloat    animationDuration;

/**
 *  set complete callback
 *
 *  @param lineWidth line width
 *  @param block     block
 *  @param duration  time
 */
- (void)startAnimationDuration:(CGFloat)duration withBlock:(DrawCircleProgressBlock )block;

```

#### 使用
```objc
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

```
