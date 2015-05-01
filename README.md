

    Charlin出框架的目标：简单、易用、实用、高度封装、绝对解耦！

#### CorePPTVC
幻灯终结者：超简单、酷且炫、多样式、自定义、无限滚动！！<br />

    注：本框架为了最大化的定制幻灯，并实现无限滚动。



#### 框架特性：<br />
>.1.ios版本兼容ios 7.0及以上.<br />
>.1.ios版本兼容ios 7.0及以上.<br />
>.1.ios版本兼容ios 7.0及以上.<br />
>.1.ios版本兼容ios 7.0及以上.<br />
>.1.ios版本兼容ios 7.0及以上.<br />
>.1.ios版本兼容ios 7.0及以上.<br />
>.1.ios版本兼容ios 7.0及以上.<br />
>.1.ios版本兼容ios 7.0及以上.<br />





<br /><br />
#### Charlin想说：<br />
此版本是全部的QuartzCore绘制，整个框架使用了几乎所有的QuartzCore技术，如果你有兴趣，可以看下源代码，
算是一个比较不错的QuartzCore实战教程。

对于本框架，有以下技术点和大家分享：<br />
1.主界面使用Xib定制，如果你需要添加控件，非常方便，比如支付宝顶部有用户头像，我这里没有，所以就没加，如果你需要加，直接在xib添加即可。<br />
2.本地数据存储使用沙盒存储。<br />
3.无任何代理设计，全程使用block解决，引用老刘的一句话，目前代理设计模式正在被块代码所逐步取代。<br />
4.解锁线条绘制使用的是比较复杂的奇偶裁剪技术。有兴趣可以看看苹果官方示例。<br />
5.关于QuartzCore，使用到的技术除了基本的绘制以外，还使用了图形上下文栈，矩阵变换，刷新图层等。<br />
6.本框架考虑了添加密码，修改密码，验证密码，忘记密码等支付宝几乎全部的功能，并且使用简单。<br />





<br /><br />

#### 使用示例
    
    /*
     *  设置密码
     */
    - (IBAction)setPwd:(id)sender {
        
        
        BOOL hasPwd = [CLLockVC hasPwd];
        hasPwd = NO;
        if(hasPwd){
            
            NSLog(@"已经设置过密码了，你可以验证或者修改密码");
        }else{
            
            [CLLockVC showSettingLockVCInVC:self successBlock:^(CLLockVC *lockVC, NSString *pwd) {
                
                NSLog(@"密码设置成功");
                [lockVC dismiss:1.0f];
            }];
        }
    }

    /*
     *  验证密码
     */
    - (IBAction)verifyPwd:(id)sender {
        
        BOOL hasPwd = [CLLockVC hasPwd];
        
        if(!hasPwd){
            
            NSLog(@"你还没有设置密码，请先设置密码");
        }else {
            
            [CLLockVC showVerifyLockVCInVC:self forgetPwdBlock:^{
                NSLog(@"忘记密码");
            } successBlock:^(CLLockVC *lockVC, NSString *pwd) {
                NSLog(@"密码正确");
                [lockVC dismiss:1.0f];
            }];
        }
    }


    /*
     *  修改密码
     */
    - (IBAction)modifyPwd:(id)sender {
        
        BOOL hasPwd = [CLLockVC hasPwd];
        
        if(!hasPwd){
            
            NSLog(@"你还没有设置密码，请先设置密码");
            
        }else {
            
            [CLLockVC showModifyLockVCInVC:self successBlock:^(CLLockVC *lockVC, NSString *pwd) {
                
                [lockVC dismiss:.5f];
            }];
        }

    }


  
  <br /><br />
#### 示例截图
![image](./CorePPTVC/1.png)<br /><br />
![image](./CorePPTVC/2.png)<br /><br />
![image](./CorePPTVC/3.png)<br /><br />
![image](./CorePPTVC/4.jpg)<br /><br />
<br /><br />
  
  


<br /><br />

-----
    CorePPTVC 幻灯终结者：超简单、酷且炫、多样式、自定义！！
-----

<br /><br />




#### 版权说明 RIGHTS <br />
作品说明：本框架由iOS开发攻城狮Charlin制作。<br />
作品时间： 2015.04.26 18:07<br />
#### 关于Chariln INTRODUCE <br />
作者简介：Charlin-四川成都华西都市报旗下华西都市网络有限公司技术部iOS工程师！<br /><br />


#### 联系方式 CONTACT <br />
Q    Q：1761904945（请注明缘由）<br />
Mail：1761904945@qq.com<br />
成都iOS开发群：163865401（Charlin创建与维护）
