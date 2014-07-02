//
//  NTTransitionProtocol.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/2/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

@objc protocol NTTransitionProtocol{
    @optional func transitionCollectionView() -> UICollectionView!
}

@objc protocol NTTansitionWaterfallGridViewProtocol{
    func snapShotForTransition() -> UIView!
}

@objc protocol NTWaterFallViewProtocol{
    func currentGridViewIndexPath() -> NSIndexPath!
}

@objc protocol NTHorizontalPageViewProtocol{
    func currentPageViewIndexPath() -> NSIndexPath!
}

@objc protocol NTWaterFallViewControllerProtocol : NTTransitionProtocol{
    func viewWillAppearWithPageIndex() -> NSInteger
}

@objc protocol NTHorizontalPageViewControllerProtocol : NTTransitionProtocol{
    func pageViewCellScrollViewContentOffset() -> CGPoint
}