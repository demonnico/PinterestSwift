//
//  NTTransitionProtocol.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/2/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

@objc protocol HBTransitionProtocol{
    @optional func transitionCollectionView() -> UICollectionView
}

protocol NTTansitionWaterfallGridViewProtocol{
    func snapShotForTransition() -> UIView
}

protocol NTWaterFallViewProtocol{
    func currentGridViewIndexPath() -> NSIndexPath
}

protocol NTHorizontalPageViewProtocol{
    func currentPageViewIndexPath() -> NSIndexPath
}

protocol NTWaterFallViewControllerProtocol : HBTransitionProtocol{
    func viewWillAppearWithPageIndex() -> NSInteger
}

protocol NTHorizontalPageViewControllerProtocol : HBTransitionProtocol{
    func pageViewCellScrollViewContentOffset() -> CGPoint
}