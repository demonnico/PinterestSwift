//
//  UIView+Utils.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/2/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func origin (_ point : CGPoint){
        frame.origin.x = point.x
        frame.origin.y = point.y
    }
}

var kIndexPathPointer = "kIndexPathPointer"

extension UICollectionView{
//    var currentIndexPath : NSIndexPath{
//    get{
//        return objc_getAssociatedObject(self,kIndexPathPointer) as NSIndexPath
//    }set{
//        objc_setAssociatedObject(self, kIndexPathPointer, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
//    }} WTF! error when building, it's a bug 
//    http://stackoverflow.com/questions/24021291/import-extension-file-in-swift
    
    func setToIndexPath (_ indexPath : IndexPath){
        objc_setAssociatedObject(self, &kIndexPathPointer, indexPath, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func toIndexPath () -> IndexPath {
        let index = self.contentOffset.x/self.frame.size.width
        if index > 0{
            return IndexPath(row: Int(index), section: 0)
        }else if let indexPath = objc_getAssociatedObject(self,&kIndexPathPointer) as? IndexPath {
            return indexPath
        }else{
            return IndexPath(row: 0, section: 0)
        }
    }
    
    func fromPageIndexPath () -> IndexPath{
        let index : Int = Int(self.contentOffset.x/self.frame.size.width)
        return IndexPath(row: index, section: 0)
    }
}
