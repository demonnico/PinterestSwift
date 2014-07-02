//
//  ViewController.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 6/30/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import UIKit

let waterfallViewCellIdentify = "waterfallViewCellIdentify"

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate{
    func navigationController(navigationController: UINavigationController!, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController!, toViewController toVC: UIViewController!) -> UIViewControllerAnimatedTransitioning!{
        let transition = NTTransition()
        transition.presenting = operation == .Pop
        return  transition
    }
}

class NTWaterfallViewController:UICollectionViewController,CHTCollectionViewDelegateWaterfallLayout, NTTransitionProtocol, NTWaterFallViewControllerProtocol{
//    class var sharedInstance: NSInteger = 0 Are u kidding me?
    var imageNameList : Array <NSString> = []
    let delegateHolder = NavigationControllerDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController.delegate = delegateHolder
        self.view.backgroundColor = UIColor.yellowColor()
        
        var index = 0
        while(index<14){
            let imageName = NSString(format: "%d.jpg", index)
            imageNameList.append(imageName)
            index++
        }
        
        collectionView.setCollectionViewLayout(CHTCollectionViewWaterfallLayout(), animated: false)
        collectionView.backgroundColor = UIColor.grayColor()
        collectionView.registerClass(NTWaterfallViewCell.self, forCellWithReuseIdentifier: waterfallViewCellIdentify)
        collectionView.reloadData()

    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let image = UIImage(named: self.imageNameList[indexPath.row] as NSString)
        let imageHeight = image.size.height*gridWidth/image.size.width
        return CGSizeMake(gridWidth, imageHeight)
    }
    
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!{
        var collectionCell: NTWaterfallViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(waterfallViewCellIdentify, forIndexPath: indexPath) as NTWaterfallViewCell
        collectionCell.imageName = self.imageNameList[indexPath.row]
        collectionCell.setNeedsLayout()
        return collectionCell;
    }
    
    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int{
        return imageNameList.count;
    }
    
    override func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!){
        let pageViewController = NTHorizontalPageViewController(collectionViewLayout: pageViewControllerLayout())
        pageViewController.imageNameList = imageNameList
        pageViewController.currentIndex = indexPath.row
        collectionView.setCurrentIndexPath(indexPath)
        navigationController.pushViewController(pageViewController, animated: true)
    }
    
    func pageViewControllerLayout () -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = screenSize
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .Horizontal
        return flowLayout
    }
    
    func viewWillAppearWithPageIndex(pageIndex : NSInteger) {
        var position : UICollectionViewScrollPosition =
        .CenteredHorizontally & .CenteredVertically
        let image = UIImage(named: self.imageNameList[pageIndex] as NSString)
        let imageHeight = image.size.height*gridWidth/image.size.width
        if imageHeight > 400 {//whatever you like, it's the max value for height of image
           position = .Top
        }
        let currentIndexPath = NSIndexPath(forRow: pageIndex, inSection: 0)
        collectionView.setCurrentIndexPath(currentIndexPath)
        if pageIndex<2{
            collectionView.setContentOffset(CGPointZero, animated: false)
        }else{
            collectionView.scrollToItemAtIndexPath(currentIndexPath, atScrollPosition: position, animated: false)
        }
    }
    
    func transitionCollectionView() -> UICollectionView!{
        return collectionView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

