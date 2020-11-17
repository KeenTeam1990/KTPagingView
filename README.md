# KTPagingView-Swift

#### [Swift Version](https://github.com/KeenTeam1990/KTPagingView)


## 结构图
![](https://github.com/KeenTeam1990/blob/master/KTPagingView/KTPagingView.png)
``` 
KTPageTitleViewConfigure（KTPageTitleView 初始化配置信息）

KTPageTitleView（用于与 KTPageContent 联动）

KTPageContentScrollView（内部由 UIScrollView 实现）

KTPageContentCollectionView（内部由 UICollectionView 实现）
``` 


## 效果图
![](https://github.com/KeenTeam1990/blob/master/KTPagingView/KTPagingView.gif)


##  Installation
* 下载、拖拽 “KTPagingView-Swift” 文件夹到工程中


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




