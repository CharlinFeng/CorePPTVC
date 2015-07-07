//
//  ViewController.m
//  CorePPTVC
//
//  Created by 冯成林 on 15/4/30.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

#import "ViewController.h"
#import "CorePPTVC.h"
#import "CoreStatus.h"



@interface ViewController ()<CoreStatusProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    PPTModel *pptModel1 = [[PPTModel alloc] init];
    pptModel1.image = [UIImage imageNamed:@"1"];
    pptModel1.title =@"复仇联盟2海报01";
    
    PPTModel *pptModel2 = [[PPTModel alloc] init];
    pptModel2.image = [UIImage imageNamed:@"2"];
    pptModel2.title =@"复仇联盟2海报02";

    PPTModel *pptModel3 = [[PPTModel alloc] init];
    pptModel3.image = [UIImage imageNamed:@"3"];
    pptModel3.title =@"复仇联盟2海报03";
    
    PPTModel *pptModel4 = [[PPTModel alloc] init];
    pptModel4.image = [UIImage imageNamed:@"4"];
    pptModel4.title =@"复仇联盟2海报04";
    
    PPTModel *pptModel5 = [[PPTModel alloc] init];
    pptModel5.image = [UIImage imageNamed:@"5"];
    pptModel5.title =@"复仇联盟2海报05";
    
    
    NSArray *pptModels = @[pptModel1,pptModel2,pptModel3,pptModel4,pptModel5];
    
    
    CorePPTVC *pptvc = [[CorePPTVC alloc] init];
    
    //传递数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            pptvc.pptModels = @[pptModel1,pptModel2,pptModel5];
        });
    });
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(16.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        pptvc.pptModels = pptModels;
    });
    

    pptvc.view.frame = CGRectMake(0, 64,320, 190);
    
    pptvc.pptItemClickBlock = ^(PPTModel *pptModel){
        NSLog(@"点击：%@",pptModel.title);
    };
    
    [self addChildViewController:pptvc];
    [self.view addSubview:pptvc.view];
    
    
    [CoreStatus beginNotiNetwork:self];
    
}

-(void)coreNetworkChangeNoti:(NSNotification *)noti{


    NSLog(@"%@",[CoreStatus currentNetWorkStatusString]);
}




@end
