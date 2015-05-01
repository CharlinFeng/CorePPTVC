
    Charlin出框架的目标：简单、易用、实用、高度封装、绝对解耦！

# CoreViewNetWorkStausManager
    网络状态提示图层管理者，提高你的app的逼格与细节。
<br />
####框架特性：<br />
>1.静态方法调用，使用简单。<br />
>2.多线程问题已经考虑，性能非常好。<br />
>3.使用VFL布局，适配所有尺寸。<br />
>4.多种场景组合，框架自己调整界面布局，一样美观。<br />
>5.支持位置细节调整。支持ScrollView<br />
>6.支持block及错误回调以及嵌套，让网络加载失败又多了一条出路。<br />
>7.此框架是大型框架CoreListMVC的核心组成框架之一。关于无缓存的CoreListMVC敬请关注Charlin的Repositories！<br />




<br /><br />
####使用示例：<br />
    
    //显示及错误回调
    [CoreViewNetWorkStausManager show:self.view type:CMTypeError msg:@"加载失败" subMsg:@"请检查网络设置" offsetY:-100 failClickBlock:^{
        
        [CoreViewNetWorkStausManager show:self.view type:CMTypeLoadingWithImage msg:@"正在加载" subMsg:@"请稍等。正在努力加载哦" offsetY:100 failClickBlock:nil];
    
    }];
    
    //隐藏
    [CoreViewNetWorkStausManager dismiss:self.view];
<br /><br />


-----
    CoreViewNetWorkStausManager   网络状态提示图层管理者，提高你的app的逼格与细节。
-----

<br /><br />

#### 版权说明 RIGHTS <br />
作品说明：本框架由iOS开发攻城狮Charlin制作。<br />
作品时间： 2013.03.12 15:28<br />


#### 关于Chariln INTRODUCE <br />
作者简介：Charlin-四川成都华西都市报旗下华西都市网络有限公司技术部iOS工程师！<br /><br />


#### 联系方式 CONTACT <br />
Q    Q：1761904945（请注明缘由）<br />
Mail：1761904945@qq.com<br />
