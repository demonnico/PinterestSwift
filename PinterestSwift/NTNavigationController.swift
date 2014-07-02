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
    override func popViewControllerAnimated(animated: Bool) -> UIViewController!
    {
        let childrenCount = self.viewControllers.count
        let toView  = self.viewControllers[childrenCount-2].view
        let popedViewController = super.popViewControllerAnimated(animated)
        let popView  = popedViewController.view
        if toView is UICollectionView && popView is UICollectionView{
            let currentIndexPath = (popView as UICollectionView).currentIndexPath()
            (toView as UICollectionView).setCurrentIndexPath(currentIndexPath)
        }
        return popedViewController
    }
    
    override func pushViewController(viewController: UIViewController!, animated: Bool) {
        let childrenCount = self.viewControllers.count
        let toView = viewController.view
        let currentView = self.viewControllers[childrenCount-1].view
        if toView is UICollectionView && currentView is UICollectionView{
            let currentIndexPath = (currentView as UICollectionView).currentIndexPath()
            (toView as UICollectionView).setCurrentIndexPath(currentIndexPath)
        }
        super.pushViewController(viewController, animated: animated)
    }
}