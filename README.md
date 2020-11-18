# KTPagingView-Swift

#### [Swift Version](https://github.com/KeenTeam1990/KTPagingView)


## <a id="配置"></a> 一. 结构图   
![image](http://qjyvam1s5.hd-bkt.clouddn.com/KTPagingView.png)
``` 
KTPageTitleViewConfigure（KTPageTitleView 初始化配置信息）

KTPageTitleView（用于与 KTPageContent 联动）

KTPageContentScrollView（内部由 UIScrollView 实现）

KTPageContentCollectionView（内部由 UICollectionView 实现）
``` 


## 效果图
![image](http://qjyvam1s5.hd-bkt.clouddn.com/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202020-11-18%20at%2009.09.43.png)
![image](http://qjyvam1s5.hd-bkt.clouddn.com/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202020-11-18%20at%2009.10.05.png)
![image](http://qjyvam1s5.hd-bkt.clouddn.com/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202020-11-18%20at%2009.09.51.png)
![image](http://qjyvam1s5.hd-bkt.clouddn.com/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202020-11-18%20at%2009.09.31.png)
![image](http://qjyvam1s5.hd-bkt.clouddn.com/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202020-11-18%20at%2009.10.00.png)
![image](http://qjyvam1s5.hd-bkt.clouddn.com/Simulator%20Screen%20Shot%20-%20iPhone%2012%20-%202020-11-18%20at%2009.09.56.png)
## <a id="安装"></a> 二.  安装 - Installation

- Cocoapods：```pod 'KTPagingView', '~> 1.0.0'```搜索不到库或最新版请执行```pod repo update```
- 手动导入：将项目中的“KTPagingView”文件夹拖入项目中

## <a id="要求"></a> 三.  要求 - Requirements

- iOS8及以上系统可使用. ARC环境. - iOS 8 or later. Requires ARC


## 代码介绍
##### KTPagingView 的使用（详细使用, 请参考 Demo）
```
// KTPageTitleViewConfigure
let configure = KTPageTitleViewConfigure()
// KTPageTitleView
self.pageTitleView = KTPageTitleView(frame: rect, delegate: self, titleNames: titles, configure: configure)
view.addSubview(pageTitleView!)

// KTPageContentScrollView
self.pageContentScrollView = KTPageContentScrollView(frame: contentRect, parentVC: self, childVCs: childVCs)
pageContentScrollView?.delegateScrollView = self
view.addSubview(pageContentScrollView!)
```

##### KTPageTitleView 代理方法
```
func pageTitleView(pageTitleView: KTPageTitleView, index: Int) {
    pageContentScrollView?.setPageContentScrollView(index: index)
}
```

##### KTPageContentScrollView 代理方法
```
func pageContentScrollView(pageContentScrollView: KTPageContentScrollView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
    pageTitleView?.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
}
```

## <a id="更多"></a> 四.  更多 - More

- 如果您发现了bug请尽可能详细地描述系统版本、手机型号和复现步骤等信息 提一个issue.

- 如果您有什么好的建议也可以提issue,大家一起讨论一起学习进步...

- 具体代码请下载项目  如果觉得喜欢的能给一颗小星星么!  ✨✨✨

- [有兴趣可以加下创建的QQ群:812144991(因为工作很忙所以可能问问题没人回答!!)](//shang.qq.com/wpa/qunwpa?idkey=ebd8d6809c83b4d6b4a18b688621cb73ded0cce092b4d1f734e071a58dd37c26) <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=294005139&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:294005139:52" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>
- The MIT License (MIT)                  Copyright (c) 2018 KEENTEAM


