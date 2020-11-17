//
//  GradientEffectVC.swift
//  KTPagingViewExample
//
//  Created by KT on 2015/9/15.
//  Copyright © 2015年 KT. All rights reserved.
//

import UIKit

class GradientEffectVC: UIViewController {
    private var pageTitleView: KTPageTitleView? = nil
    private var pageContentCollectionView: KTPageContentCollectionView? = nil
    
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
        print("GradientEffectVC - - deinit")
    }
}

extension GradientEffectVC {
    private func setupKTPagingView() {
        let statusHeight = UIApplication.shared.statusBarFrame.height
        var pageTitleViewY: CGFloat = 0.0
        if statusHeight == 20 {
            pageTitleViewY = 64
        } else {
            pageTitleViewY = 88
        }
        
        let titles = ["精选", "电影", "电视剧", "综艺"]
        let configure = KTPageTitleViewConfigure()
        configure.titleColor = UIColor.lightGray
        configure.titleSelectedColor = UIColor.black
        configure.indicatorColor = UIColor.black
        configure.indicatorAdditionalWidth = 80
        configure.titleGradientEffect = true
        
        self.pageTitleView = KTPageTitleView(frame: CGRect(x: 0, y: pageTitleViewY, width: view.frame.size.width, height: 44), delegate: self, titleNames: titles, configure: configure)
        view.addSubview(pageTitleView!)
        
        let oneVC = ChildOneVC()
        let twoVC = ChildTwoVC()
        let threeVC = ChildThreeVC()
        let fourVC = ChildFourVC()
        let childVCs = [oneVC, twoVC, threeVC, fourVC]
        
        let contentViewHeight = view.frame.size.height - self.pageTitleView!.frame.maxY
        let contentRect = CGRect(x: 0, y: (pageTitleView?.frame.maxY)!, width: view.frame.size.width, height: contentViewHeight)
        self.pageContentCollectionView = KTPageContentCollectionView(frame: contentRect, parentVC: self, childVCs: childVCs)
        pageContentCollectionView?.delegateCollectionView = self
        view.addSubview(pageContentCollectionView!)
    }
}

extension GradientEffectVC: KTPageTitleViewDelegate, KTPageContentCollectionViewDelegate {
    func pageTitleView(pageTitleView: KTPageTitleView, index: Int) {
        pageContentCollectionView?.setPageContentCollectionView(index: index)
    }
    
    func pageContentCollectionView(pageContentCollectionView: KTPageContentCollectionView, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        pageTitleView?.setPageTitleView(progress: progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
}

