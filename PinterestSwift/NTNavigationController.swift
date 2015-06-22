//
//  NTNavigationController.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/2/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit
class NTNavigationController : UINavigationController{
    override func popViewControllerAnimated(animated: Bool) -> UIViewController
    {
        //viewWillAppearWithPageIndex
        let childrenCount = self.viewControllers.count
        let toViewController = self.viewControllers[childrenCount-2] as! NTWaterFallViewControllerProtocol
        let toView = toViewController.transitionCollectionView()
        let popedViewController = self.viewControllers[childrenCount-1] as! UICollectionViewController
        let popView  = popedViewController.collectionView!;
        let indexPath = popView.fromPageIndexPath()
        toViewController.viewWillAppearWithPageIndex(indexPath.row)
        toView.setToIndexPath(indexPath)
        return super.popViewControllerAnimated(animated)!
    }
    
//    override func pushViewController(viewController: UIViewController!, animated: Bool) {
//        let childrenCount = self.viewControllers.count
//        let toView = viewController.view
//        let currentView = self.viewControllers[childrenCount-1].view
////        if toView is UICollectionView && currentView is UICollectionView{
////            let currentIndexPath = (currentView as UICollectionView).currentIndexPath()
////            (toView as UICollectionView).setCurrentIndexPath(currentIndexPath)
////        }
//        super.pushViewController(viewController, animated: animated)
//    }
}