//
//  ZoomVC.swift
//  KTPagingViewExample
//
//  Created by KT on 2015/9/15.
//  Copyright © 2015年 KT. All rights reserved.
//

import UIKit

class ZoomVC: UIViewController {
    private var pageTitleView: KTPageTitleView? = nil
    private var pageContentCollectionView: KTPageContentCollectionView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        setupKTPagingView()
    }
    
    deinit {
        print("ZoomVC - - deinit")
    }
}

extension ZoomVC {
    private func setupKTPagingView() {
        let statusHeight = UIApplication.shared.statusBarFrame.height
        var pageTitleViewY: CGFloat = 0.0
        if statusHeight == 20 {
            pageTitleViewY = 64
        } else {
            pageTitleViewY = 88
        }
        
        let titles = ["精选", "电影", "电视剧", "综艺", "NBA", "娱乐", "动漫", "演唱会", "VIP会员"]
        let configure = KTPageTitleViewConfigure()
        configure.showIndicator = false
        configure.titleTextZoom = true
        configure.titleTextZoomRatio = 0.5
        configure.titleAdditionalWidth = 30
        configure.titleGradientEffect = true
        
        self.pageTitleView = KTPageTitleView(frame: CGRect(x: 0, y: pageTitleViewY, width: view.frame.size.width, height: 44), delegate: self, titleNames: titles, configure: configure)
        view.addSubview(pageTitleView!)
        
        let oneVC = ChildOneVC()
        let twoVC = ChildTwoVC()
        let threeVC = ChildThreeVC()
        let fourVC = ChildFourVC()
        let fiveVC = ChildFiveVC()
        let sixVC = ChildSixVC()
        let sevenVC = ChildSevenVC()
        let eightVC = ChildEightVC()
        let nineVC = ChildNineVC()
        
        let childVCs = [oneVC, twoVC, threeVC, fourVC, fiveVC, sixVC, sevenVC, eightVC, nineVC]
        
        let contentViewHeight = view.frame.size.height - self.pageTitleView!.frame.maxY
        let contentRect = CGRect(x: 0, y: (pageTitleView?.frame.maxY)!, width: view.frame.size.width, height: contentViewHeight)
        self.pageContentCollectionView = KTPageContentCollectionView(frame: contentRect, parentVC: self, childVCs: childVCs)
        pageContentCollectionView?.delegateCollectionView = self
        view.addSubview(pageContentCollectionView!)
    }
}

extension ZoomVC: KTPageTitleViewDelegate, KTPageContentCollectionViewDelegate {
    func pageTitleView(pageTitleView: KTPageTitleView, index: Int) {
        pageContentCollectionView?.setPageContentCollectionView(index: index)
    }
    
    func pageContentCollectionView(pageContentCollectionView: KTPageContentCollectionView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        pageTitleView?.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}

