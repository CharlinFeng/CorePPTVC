//
//  PPTConst.h
//  CorePPTVC
//
//  Created by 冯成林 on 15/4/30.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#ifndef _PPTConst_H_
#define _PPTConst_H_

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIColor+Extend.h"



/** pageControl的size */
#define PPTPagecontrolSize CGSizeMake(8,2)


/** pageControl的普通颜色 */
#define PPTPagecontrolNormalColor rgba(255,255,255,1)


/** pageControl的选中 */
#define PPTPagecontrolCurrentColor rgba(237,79,40,1)





/** 总组数 */
extern NSUInteger const PPTsectionCount;


/** 是否开启transition动画 */
extern BOOL const isUseTransitionAnim;


/** 动画时长 */
extern CGFloat const PPTAnimTime;




#endif




