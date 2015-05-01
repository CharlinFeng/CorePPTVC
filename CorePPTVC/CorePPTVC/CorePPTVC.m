//
//  CorePPTCVC.m
//  CorePPTCVC
//
//  Created by 冯成林 on 15/4/30.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "CorePPTVC.h"
#import "PPTCell.h"
#import "PPTLayout.h"
#import "PPTConst.h"
#import "PPTPageControl.h"
#import "CALayer+Transition.h"
#import "UIView+Extend.h"



@interface CorePPTVC ()<UICollectionViewDataSource,UICollectionViewDelegate>


/*
 *  控件
 */

@property (weak, nonatomic) IBOutlet UICollectionView *clv;

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet PPTPageControl *pageControl;







/** 页码 */
@property (nonatomic,assign) NSUInteger page;


/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;


@property (nonatomic,assign) NSUInteger count;


/** section */
@property (nonatomic,assign) NSUInteger section;




@end



@implementation CorePPTVC






/**
 *  实例化
 *
 *  @param pptModels 幻灯模型数组
 *
 *  @return 控制器实例
 */
+(instancetype)pptWithPPTModels:(NSArray *)pptModels{
    
    CorePPTVC *pptvc = [[CorePPTVC alloc] init];
    
    if(pptModels== nil || pptModels.count == 0){
        
        NSLog(@"请传入幻灯模型数组");
        return nil;
    }
    
    //记录模型
    pptvc.pptModels = pptModels;
    
    return pptvc;
}




- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //控制器准备
    [self vcPrepare];
    
    [self.clv reloadData];
}


/*
 *  控制器准备
 */
-(void)vcPrepare{
    
    //注册cell
    [PPTCell registerWithNibForCollectionView:self.clv];
    
    //隐藏collectionView的水平滚动条
    self.clv.showsHorizontalScrollIndicator = NO;
    
    self.section =PPTsectionCount * .5f;
    
    //添加border
    [self.view setBorder:rgba(0, 0, 0, 0.06f) width:0.5f];
}



-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    //滚到中间
    [self scrollMid];
    
    //手动触发
    [self updateLabelWhenPageChanged];
        
    //开启时钟
    [self timerOn];
}


/*
 *  滚到中间
 */
-(void)scrollMid{
    
    if(self.pptModels == nil || self.count == 0) return;
    
    NSUInteger section = PPTsectionCount * .5f;
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:0 inSection:section];
    
    [self.clv scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}



-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    //设置布局
    self.clv.collectionViewLayout = [PPTLayout layout:self.view.bounds.size];
}





-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    //关闭定时器
    [self timerOff];
}




/*
 *  collectionView代理方法区
 */


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSUInteger section = self.count==0?0:PPTsectionCount;
    return section;
}


/*
 *  组内有多少条数组
 */
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.count;
}



/*
 *  collectionViewCell具体内容
 */
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PPTCell *cell = [PPTCell dequeueReusableCellForCollectionView:collectionView indexPath:indexPath];
    
    //取出模型
    PPTModel *pptModel = self.pptModels[indexPath.item];
    
    cell.pptModel = pptModel;
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    //取出模型
    PPTModel *pptModel = self.pptModels[indexPath.item];
    
    if(_pptItemClickBlock != nil) _pptItemClickBlock(pptModel);
}




/*
 *  scrollView代理方法区
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSUInteger page = (NSUInteger)(scrollView.contentOffset.x / scrollView.bounds.size.width + .5f);
    
    page = page % self.count;
    
    self.page = page;
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    //关闭定时器
    [self timerOff];
}


-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //开启定时器
    [self timerOn];
}






-(void)setPage:(NSUInteger)page{
    
    if(_page == page) return;
    
    _page = page;
    
    //更新pageControl的页码
    self.pageControl.currentPage = page;
    
    //更新label
    [self updateLabelWhenPageChanged];
}


/*
 *  更新label
 */
-(void)updateLabelWhenPageChanged{
    
    //取出模型
    PPTModel *pptModel = self.pptModels[_page];
    
    //更改文字
    self.label.text = [NSString stringWithFormat:@"  %@",pptModel.title];
}




/*
 *  定时器
 */

/*
 *  新开一个定时器
 */
-(void)timerOn{
    
    [self timerOff];
    
    if(self.timer!=nil || self.count==0 || self.clv==nil) return;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:6.0f target:self selector:@selector(timerRunAction) userInfo:nil repeats:YES];
    
    //记录
    self.timer = timer;
    
    //加入主循环
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}


/*
 *  定时器工作内容
 */
-(void)timerRunAction{
    
    // 1.马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [self resetIndexPath];
    
    // 2.计算出下一个需要展示的位置
    NSInteger nextItem = currentIndexPathReset.item + 1;
    NSInteger nextSection = currentIndexPathReset.section;
    if (nextItem == self.count) {
        nextItem = 0;
        nextSection++;
    }
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:nextItem inSection:nextSection];
    
    // 3.通过动画滚动到下一个位置
    if(!isUseTransitionAnim){
        [self.clv scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }else{
        [self.clv scrollToItemAtIndexPath:nextIndexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        [self animForTransition];
    }
    

}

-(void)animForTransition{
    
    if(!isUseTransitionAnim) return;
    [self.clv.layer transitionWithAnimType:TransitionAnimTypeRippleEffect subType:TransitionSubtypesFromBotoom curve:TransitionCurveEaseInEaseOut duration:PPTAnimTime];
}

- (NSIndexPath *)resetIndexPath
{
    // 当前正在展示的位置
    NSIndexPath *currentIndexPath = [[self.clv indexPathsForVisibleItems] lastObject];
    // 马上显示回最中间那组的数据
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:PPTsectionCount/2];
    [self.clv scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    return currentIndexPathReset;
}





/*
 *  关闭定时器
 */
-(void)timerOff{
    
    //关闭定时器
    [self.timer invalidate];
    
    //清空属性
    self.timer = nil;
}



-(void)setPptModels:(NSArray *)pptModels{
    
    _pptModels = pptModels;
    
    self.count = pptModels.count;
}




-(void)setCount:(NSUInteger)count{
    
    _count = count;
    
    if(count==0) return;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [self dataFill];
    });
}

-(void)dataFill{
    
    [self.clv reloadData];
    
    [self animForTransition];
    
    //pagecontrol
    self.pageControl.numberOfPages = self.count;

    
    //显示label
    [UIView animateWithDuration:PPTAnimTime animations:^{
        self.label.alpha = 1.0;
        self.pageControl.alpha = 1.0f;
    }];
    
    //更新文字
    [self updateLabelWhenPageChanged];
    
    //开启定时器
    [self timerOn];
    
    //去除border
    [self.view setBorder:[UIColor clearColor] width:0];
    
    //滚到中间
    [self scrollMid];
}








@end
