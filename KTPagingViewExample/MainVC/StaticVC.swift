//
//  StaticVC.swift
//  KTPagingViewExample
//
//  Created by KT on 2015/9/15.
//  Copyright © 2015年 KT. All rights reserved.
//

import UIKit

class StaticVC: UIViewController {

    private var pageTitleView: KTPageTitleView? = nil
    private var pageContentScrollView: KTPageContentScrollView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        setupKTPagingView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("StaticVC - - deinit")
    }
}

extension StaticVC {
    private func setupKTPagingView() {
        let statusHeight = UIApplication.shared.statusBarFrame.height
        var pageTitleViewY: CGFloat = 0.0
        if statusHeight == 20 {
            pageTitleViewY = 64
        } else {
            pageTitleViewY = 88
        }
        
        let titles = ["精选", "资讯", "新闻", "公告"]
        let configure = KTPageTitleViewConfigure()
        configure.indicatorScrollStyle = .Default
        configure.indicatorStyle = .Default
        configure.indicatorHeight = 2
        configure.indicatorCornerRadius = 5
        configure.indicatorToBottomDistance = 5
        configure.titleFont = UIFont.systemFont(ofSize: 12)
        configure.titleSelectedFont = UIFont.systemFont(ofSize: 16)
        configure.bottomSeparatorColor = UIColor.red

        self.pageTitleView = KTPageTitleView(frame: CGRect(x: 0, y: pageTitleViewY, width: view.frame.size.width, height: 44), delegate: self, titleNames: titles, configure: configure)
        pageTitleView?.index = 0
        view.addSubview(pageTitleView!)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.pageTitleView?.resetTitle(title: "政策", index: 1)
//        }
        
        let oneVC = ChildOneVC()
        let twoVC = ChildTwoVC()
        let threeVC = ChildThreeVC()
        let fourVC = ChildFourVC()
        let childVCs = [oneVC, twoVC, threeVC, fourVC]

        let contentViewHeight = view.frame.size.height - self.pageTitleView!.frame.maxY
        let contentRect = CGRect(x: 0, y: (pageTitleView?.frame.maxY)!, width: view.frame.size.width, height: contentViewHeight)
        self.pageContentScrollView = KTPageContentScrollView(frame: contentRect, parentVC: self, childVCs: childVCs)
        pageContentScrollView?.delegateScrollView = self
        view.addSubview(pageContentScrollView!)
    }
}

extension StaticVC: KTPageTitleViewDelegate, KTPageContentScrollViewDelegate {
    func pageTitleView(pageTitleView: KTPageTitleView, index: Int) {
        pageContentScrollView?.setPageContentScrollView(index: index)
    }
    
    func pageContentScrollView(pageContentScrollView: KTPageContentScrollView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        pageTitleView?.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
    func pageContentScrollView(pageContentScrollView: KTPageContentScrollView, index: Int) {
        /// 说明：在此获取标题or当前子控制器下标值
        print("index - - %ld", index)
    }
}


