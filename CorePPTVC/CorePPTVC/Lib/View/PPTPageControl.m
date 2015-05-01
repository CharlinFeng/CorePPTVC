//
//  PPTPageControl.m
//  CorePPTVC
//
//  Created by 冯成林 on 15/4/30.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "PPTPageControl.h"
#import "UIImage+Color.h"
#import "PPTConst.h"




@implementation PPTPageControl



-(void)awakeFromNib{
    
    [super awakeFromNib];

    //禁用交互
    self.userInteractionEnabled = NO;

    //普通图片
    self.pageIndicatorImage = [UIImage imageFromContextWithColor:PPTPagecontrolNormalColor size:PPTPagecontrolSize];
    
    //当前图片
    self.currentPageIndicatorImage = [UIImage imageFromContextWithColor:PPTPagecontrolCurrentColor size:PPTPagecontrolSize];
    
    //居中
    self.alignment = SMPageControlAlignmentCenter;
}



-(void)setNumberOfPages:(NSInteger)numberOfPages{
    
    [super setNumberOfPages:numberOfPages];
    
    //页码清零
    self.currentPage = 0;
}



@end
