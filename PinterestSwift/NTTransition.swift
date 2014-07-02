//
//  NTTransition.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/2/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

let animationDuration = 4.0
let animationScale : CGFloat = 2.19123

class NTTransition : NSObject , UIViewControllerAnimatedTransitioning{
    var presenting = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval{
        return animationDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        if presenting {
            
        }else{
            let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as UIViewController
            let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
            as UIViewController
            
            let fromView = fromViewController.view
            let toView = toViewController.view
            
            let waterFallView : UICollectionView = (fromViewController as NTTransitionProtocol).transitionCollectionView!()
            let pageView : UICollectionView = (toViewController as NTTransitionProtocol).transitionCollectionView!()
            
            let containerView = transitionContext.containerView()
            containerView.addSubview(fromView)
            containerView.addSubview(toView)
            
            let indexPath = (waterFallView as NTWaterFallViewProtocol).currentGridViewIndexPath()
            let gridView = waterFallView.cellForItemAtIndexPath(indexPath)
            
            let leftUpperPoint = gridView.convertPoint(CGPointZero, toView: nil)
            pageView.hidden = true
            pageView.scrollToItemAtIndexPath(indexPath, atScrollPosition:.CenteredHorizontally, animated: false)
            
            let offsetY : CGFloat = fromViewController.navigationController.navigationBarHidden ? 0.0 : navigationHeaderAndStatusbarHeight
            let snapShot = (gridView as NTTansitionWaterfallGridViewProtocol).snapShotForTransition()
            containerView.addSubview(snapShot)
//            snapShot.origin = leftUpperPoint TODO WTF,ERROR When building
            
            UIView.animateWithDuration(animationDuration, animations: {
                snapShot.transform = CGAffineTransformMakeScale(animationScale,
                    animationScale)
//                snapShot.origin = CGPointMake(0, offsetY) WTF!
                
                fromView.alpha = 0
                fromView.transform = snapShot.transform
                fromView.frame = CGRectMake(-(leftUpperPoint.x)*animationScale,
                    -(leftUpperPoint.y-offsetY)*animationScale+offsetY,
                    fromView.frame.size.width,
                    fromView.frame.size.height)
                })
        }
    }
}