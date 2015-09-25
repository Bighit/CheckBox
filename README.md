#CheckBox

一个方便的复选框，将他加入你的页面只需实例化并给与必要的信息就可以了。

比如这样
```
CheckBox *box=[[CheckBox alloc]initWithItemTitleArray:@[@"11",@"22"] columns:3];
[box setNormalImage:[UIImage imageNamed:@"icon_check_n"]]; 
[box setSelectedImage:[UIImage imageNamed:@"icon_check_s"]];
```
然后设置一下frame 加在你的视图上就可以了。
***
##获取checkBox状态
你只需通过  
```
- (BOOL)getItemSelectedAtIndex:(NSUInteger)index; 
```
获得某个下标的item的状态,返回BOOL值  
或者你也可以这样
```
- (NSArray *)getSelectedItemIndexs;
```
得到一个带有被选中item下标的数组，然后你可以继续做你的业务逻辑。

##有问题反馈
在使用中有任何问题，欢迎反馈给我，可以用以下联系方式跟我交流

* QQ:  393858338
* 邮箱: hty393858339@163.com

##作者
* HTY 
