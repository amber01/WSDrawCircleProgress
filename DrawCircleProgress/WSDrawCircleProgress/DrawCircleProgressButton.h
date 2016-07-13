//
//  DrawCircleProgressButton.h
//  DrawCircleProgress
//
//  Created by shlity on 16/7/13.
//  Copyright © 2016年 Moresing Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DrawCircleProgressBlock)(void);

@interface DrawCircleProgressButton : UIButton

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

@end
