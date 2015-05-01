//
//  PPTCell.h
//  CorePPTCVC
//
//  Created by 冯成林 on 15/4/30.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPTModel.h"

@interface PPTCell : UICollectionViewCell


/** 幻灯数据模型 */
@property (nonatomic,strong) PPTModel *pptModel;







/**
 *  为cell所属collectionView注册cell（从Nib注册）
 *
 *  @param clv collectionView
 */
+(void)registerWithNibForCollectionView:(UICollectionView *)clv;




/**
 *  取出cell
 *
 *  @param clv       collectionView
 *  @param indexPath indexPath
 *
 *  @return cell
 */
+(instancetype)dequeueReusableCellForCollectionView:(UICollectionView *)clv indexPath:(NSIndexPath *)indexPath;





@end
