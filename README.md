# HZKAlertViewDemo

HZKAlertView弹框，支持显示标题，详情内容，多个按钮选择，取消按钮选择



# demo
  1，将demo里面的HZKAlertView文件夹拷贝到项目中。
  2，代码如下：
  
  ```
   #import "HZKAlertview.h"
   
   HZKAlertview *alertView = [[HZKAlertview alloc]initWithTitle:@"标题标题" detial:@"多个其他按钮 + 取消按钮" detialTextAlignment:NSTextAlignmentCenter cancelBtnString:@"取消" otherBtnStringArray:@[@"按钮1",@"按钮2",@"按钮3"]];
    alertView.delegate = self;
    [alertView show];
    
    
    #pragma mark - HZKAlertviewDelegate
   -(void)HZKAlertview:(HZKAlertview *)alertView ConfirmButtonClickButtonIndex:(NSUInteger)index WithInfo:(NSString *)info
   {
   
      NSLog(@"其他按钮点击");
      
   }

   -(void)HZKAlertview:(HZKAlertview *)alertView CancelButtonClickWithInfo:(NSString *)info
   {
   
      NSLog(@"取消按钮点击");
      
   }
```
# 效果图如下：
![image](https://github.com/kaijiemu/HZKAlertViewDemo/blob/master/show.gif ) 



