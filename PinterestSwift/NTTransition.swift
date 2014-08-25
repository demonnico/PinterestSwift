//
//  NTTransition.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/2/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

let animationDuration = 0.35
let animationScale : CGFloat = screenWidth/gridWidth // screenWidth / the width of waterfall collection view's grid

class NTTransition : NSObject , UIViewControllerAnimatedTransitioning{
    var presenting = false
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval{
        return animationDuration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as UIViewController
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as UIViewController
        let containerView = transitionContext.containerView()

        if presenting {
            let toView = toViewController.view
            containerView.addSubview(toView)
            toView.hidden = true
            
            let waterFallView = (toViewController as NTTransitionProtocol).transitionCollectionView()
            let pageView = (fromViewController as NTTransitionProtocol).transitionCollectionView()
            
            waterFallView.layoutIfNeeded()
            let indexPath = pageView.currentIndexPath()
            let gridView = waterFallView.cellForItemAtIndexPath(indexPath)
            waterFallView.performBatchUpdates(nil, completion: nil)
            let leftUpperPoint = gridView.convertPoint(CGPointZero, toView: nil)

            let snapShot = (gridView as NTTansitionWaterfallGridViewProtocol).snapShotForTransition()
            snapShot.transform = CGAffineTransformMakeScale(animationScale, animationScale)
            let pullOffsetY = (fromViewController as NTHorizontalPageViewControllerProtocol).pageViewCellScrollViewContentOffset().y
            let offsetY : CGFloat = fromViewController.navigationController.navigationBarHidden ? 0.0 : navigationHeaderAndStatusbarHeight
            snapShot.origin(CGPointMake(0, -pullOffsetY+offsetY))
            containerView.addSubview(snapShot)
            
            toView.hidden = false
            toView.alpha = 0
            toView.transform = snapShot.transform
            toView.frame = CGRectMake(-(leftUpperPoint.x * animationScale),-((leftUpperPoint.y-offsetY) * animationScale+pullOffsetY+offsetY),
                toView.frame.size.width, toView.frame.size.height)
            let whiteViewContainer = UIView(frame: screenBounds)
            whiteViewContainer.backgroundColor = UIColor.whiteColor()
            containerView.addSubview(snapShot)
            containerView.insertSubview(whiteViewContainer, belowSubview: toView)
            
            UIView.animateWithDuration(animationDuration, animations: {
                snapShot.transform = CGAffineTransformIdentity
                snapShot.origin(leftUpperPoint)
                
                toView.transform = CGAffineTransformIdentity
                toView.origin(CGPointZero)
                toView.alpha = 1
                }, completion:{finished in
                    if finished {
                        snapShot.removeFromSuperview()
                        whiteViewContainer.removeFromSuperview()
                        transitionContext.completeTransition(true)
                    }
                })
        }else{
            let fromView = fromViewController.view
            let toView = toViewController.view
            
            let waterFallView : UICollectionView = (fromViewController as NTTransitionProtocol).transitionCollectionView()
            let pageView : UICollectionView = (toViewController as NTTransitionProtocol).transitionCollectionView()
            
            containerView.addSubview(fromView)
            containerView.addSubview(toView)
            
            let indexPath = waterFallView.currentIndexPath()
            let gridView = waterFallView.cellForItemAtIndexPath(indexPath)
            
            let leftUpperPoint = gridView.convertPoint(CGPointZero, toView: nil)
            pageView.hidden = true
            pageView.scrollToItemAtIndexPath(indexPath, atScrollPosition:.CenteredHorizontally, animated: false)
            
            let offsetY : CGFloat = fromViewController.navigationController.navigationBarHidden ? 0.0 : navigationHeaderAndStatusbarHeight
            let offsetStatuBar : CGFloat = fromViewController.navigationController.navigationBarHidden ? 0.0 :
                statubarHeight;
            let snapShot = (gridView as NTTansitionWaterfallGridViewProtocol).snapShotForTransition()
            containerView.addSubview(snapShot)
            snapShot.origin(leftUpperPoint)
            
            UIView.animateWithDuration(animationDuration, animations: {
                snapShot.transform = CGAffineTransformMakeScale(animationScale,
                    animationScale)
                snapShot.origin(CGPointMake(0, offsetY))
                
                fromView.alpha = 0
                fromView.transform = snapShot.transform
                fromView.frame = CGRectMake(-(leftUpperPoint.x)*animationScale,
                    -(leftUpperPoint.y-offsetStatuBar)*animationScale+offsetStatuBar,
                    fromView.frame.size.width,
                    fromView.frame.size.height)
                },completion:{finished in
                    if finished {
                        snapShot.removeFromSuperview()
                        pageView.hidden = false
                        fromView.transform = CGAffineTransformIdentity
                        transitionContext.completeTransition(true)
                    }
                })
        }
    }
}