//
//  ViewController.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 6/30/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import UIKit

let waterfallViewCellIdentify = "waterfallViewCellIdentify"

class NTWaterfallViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout, NTTransitionProtocol{
//    class var sharedInstance: NSInteger = 0 Are u kidding me?
    let collectionView : UICollectionView = UICollectionView(frame: screenBounds, collectionViewLayout: CHTCollectionViewWaterfallLayout())
    var imageNameList : Array <NSString> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.yellowColor()
        
        var index = 0
        while(index<14){
            let imageName = NSString(format: "%d.jpg", index)
            imageNameList.append(imageName)
            index++
        }
        
        self.view.addSubview(collectionView)
        
        collectionView.backgroundColor = UIColor.grayColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(NTWaterfallViewCell.self, forCellWithReuseIdentifier: waterfallViewCellIdentify)
        collectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        let image = UIImage(named: self.imageNameList[indexPath.row] as NSString)
        let imageHeight = image.size.height*145/image.size.width
        return CGSizeMake(145, imageHeight)
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!{
        var collectionCell: NTWaterfallViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(waterfallViewCellIdentify, forIndexPath: indexPath) as NTWaterfallViewCell
        collectionCell.imageName = self.imageNameList[indexPath.row]
        collectionCell.setNeedsLayout()
        return collectionCell;
    }
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int{
        return imageNameList.count;
    }
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!){
        let pageViewController = NTHorizontalPageViewController(collectionViewLayout: pageViewControllerLayout())
        pageViewController.imageNameList = imageNameList
        pageViewController.currentIndex = indexPath.row
        presentViewController(pageViewController, animated: true, completion: {})
    }
    
    func pageViewControllerLayout () -> UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = screenSize
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .Horizontal
        return flowLayout
    }
    
    func transitionCollectionView() -> UICollectionView!{
        return collectionView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

