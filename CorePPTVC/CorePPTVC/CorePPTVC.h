//
//  CorePPTCVC.h
//  CorePPTCVC
//
//  Created by 冯成林 on 15/4/30.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PPTModel.h"


@interface CorePPTVC : UIViewController


/** 点击了幻灯的回调 */
@property (nonatomic,copy) void (^pptItemClickBlock)(PPTModel *pptModel);


/** 幻灯模型数组 */
@property (nonatomic,strong) NSArray *pptModels;










@end
