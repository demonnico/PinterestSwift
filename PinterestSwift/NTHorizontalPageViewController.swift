//
//  NTHorizontalPageViewController.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/1/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

let horizontalPageViewCellIdentify = "horizontalPageViewCellIdentify"

class NTHorizontalPageViewController : UICollectionViewController, NTTransitionProtocol ,NTHorizontalPageViewControllerProtocol{
    
    var imageNameList : Array <NSString> = []
    var currentIndex = 0
    var pullOffset = CGPointZero
    override func viewDidLoad(){
        super.viewDidLoad()
        self.collectionView.pagingEnabled = true
        self.collectionView.registerClass(NTHorizontalPageViewCell.self, forCellWithReuseIdentifier: horizontalPageViewCellIdentify)
       
        let indexPath = NSIndexPath(forRow: currentIndex, inSection: 0)
        self.collectionView.performBatchUpdates({self.collectionView.reloadData()}, completion: { finished in
            if finished {
                self.collectionView.scrollToItemAtIndexPath(indexPath,atScrollPosition:.CenteredHorizontally, animated: false)
            }});
    }
    
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!{
        var collectionCell: NTHorizontalPageViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(horizontalPageViewCellIdentify, forIndexPath: indexPath) as NTHorizontalPageViewCell
        collectionCell.imageName = self.imageNameList[indexPath.row]
        collectionCell.tappedAction = {}
        collectionCell.pullAction = { offset in
            self.pullOffset = offset
            self.navigationController.popViewControllerAnimated(true)
        }
        collectionCell.setNeedsLayout()
        return collectionCell
    }
    
    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int{
        return imageNameList.count;
    }
    
    func transitionCollectionView() -> UICollectionView!{
        return collectionView
    }
    
    func pageViewCellScrollViewContentOffset() -> CGPoint{
        return self.pullOffset
    }
}