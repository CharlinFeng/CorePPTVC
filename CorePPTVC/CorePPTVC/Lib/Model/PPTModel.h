//
//  PPTModel.h
//  CorePPTCVC
//
//  Created by 冯成林 on 15/4/30.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//  幻灯模型，具体使用可以添加属性


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface PPTModel : NSObject

/** 图片 */
@property (nonatomic,strong) UIImage *image;

/** 远程服务器地址 */
@property (nonatomic,copy) NSString *imageURLString;

/** 图片说明文字：标题 */
@property (nonatomic,copy) NSString *title;


/** 图片点击事件block：主要用于处理图片点击事件 */
@property (nonatomic,copy) void(^PPTClickBlock)(PPTModel *pptModel);





@end
